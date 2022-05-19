class Video {
  Video({
    required this.id,
    required this.url,
    required this.title,
    required this.thumbnailUrl,
    required this.publishedAt,
    required this.channelTitle,
  });

  factory Video.fromMap(dynamic snippet) {
    return Video(
      id: snippet['resourceId']['videoId'],
      url:
          'https://www.youtube.com/watch?v=${snippet['resourceId']['videoId']}',
      title: snippet['title'],
      thumbnailUrl: snippet['thumbnails']['high']['url'],
      publishedAt: snippet['thumbnails']['publishedAt'],
      channelTitle: snippet['channelTitle'],
    );
  }

  final dynamic id;
  final dynamic url;
  final dynamic title;
  final dynamic thumbnailUrl;
  final dynamic publishedAt;
  final dynamic channelTitle;
}
