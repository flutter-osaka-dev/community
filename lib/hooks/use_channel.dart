import 'dart:convert';

import 'package:community/entity/channel.dart';
import 'package:community/entity/video.dart';
import 'package:http/http.dart' as http;

String channelId = 'UChmWPiBWf1oMfR14iYsihhw';
String key = 'AIzaSyBnfyuNhmX6qg3xsEntDxcL8WnEinoqBE0';
String _baseUrl = 'www.googleapis.com';
var _nextPageToken = '';

UseChannel useChannel() {
  Future<List<Video>?> fetchVideosFromPlaylist(String playlistId) async {
    final parameters = <String, String>{
      'part': 'snippet',
      'playlistId': playlistId,
      'maxResults': '30',
      'pageToken': _nextPageToken,
      'key': key,
    };
    final response = await http.get(Uri.https(
      _baseUrl,
      '/youtube/v3/playlistItems',
      parameters,
    ));
    if (response.statusCode == 200) {
      final dynamic data = json.decode(response.body);

      _nextPageToken = data['nextPageToken']?.toString() ?? '';
      final dynamic videosJson = data['items'];

      final videos = <Video>[];
      videosJson.forEach(
        (dynamic json) => videos.add(
          Video.fromMap(json['snippet']),
        ),
      );
      return videos;
    } else {
      // throw json.decode(response.body)['error']['message'];
      return null;
    }
  }

  Future<Channel?> fetchChannel(String channelId) async {
    final parameters = <String, String>{
      'part': 'snippet, contentDetails, statistics',
      'id': channelId,
      'key': key,
    };
    final response = await http.get(Uri.https(
      _baseUrl,
      '/youtube/v3/channels',
      parameters,
    ));
    if (response.statusCode == 200) {
      final dynamic data = json.decode(response.body)['items'][0];
      final channel = Channel.fromMap(data);

      channel.videos = await fetchVideosFromPlaylist(
        channel.uploadPlaylistId.toString(),
      );
      return channel;
    } else {
      // throw json.decode(response.body)['error']['message'];
      return null;
    }
  }

  return UseChannel(
    fetchVideosFromPlaylist: fetchVideosFromPlaylist,
    fetchChannel: fetchChannel,
  );
}

class UseChannel {
  UseChannel(
      {required this.fetchVideosFromPlaylist, required this.fetchChannel});
  final Future<List<Video>?> Function(String playlistId)
      fetchVideosFromPlaylist;
  final Future<Channel?> Function(String channelId) fetchChannel;
}
