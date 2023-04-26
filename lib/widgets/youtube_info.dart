import 'package:community/hooks/use_channel.dart';
import 'package:community/widgets/custom_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class YouTubeInfo extends StatelessWidget {
  YouTubeInfo({Key? key}) : super(key: key);

  final channelHook = useChannel();

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return FutureBuilder<dynamic>(
      future: channelHook.fetchChannel(channelId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(children: <Widget>[
            CustomTypography.heading(appLocalizations.sessions,
                type: 'heading', textAlign: TextAlign.center),
            const Gap(16),
            CustomTypography(appLocalizations.session_description1,
                type: 'body', textAlign: TextAlign.center),
            CustomTypography(appLocalizations.session_description2,
                type: 'body', textAlign: TextAlign.center),
            const Gap(16),
            const SizedBox(width: 12),
            Column(
              children: <Widget>[
                ...snapshot.data!.videos.map((dynamic video) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 35,
                        backgroundImage: NetworkImage(
                            snapshot.data!.profilePictureUrl as String),
                      ),
                      onTap: () async {
                        await launch(
                          video.url as String,
                          webOnlyWindowName: '_blank',
                        );
                      },
                      title: Text(video.title as String),
                      subtitle: Text(video.channelTitle as String),
                      trailing: Icon(Icons.more_vert),
                    ),
                  );
                })
              ],
            ),
            const Gap(32),
          ]);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
