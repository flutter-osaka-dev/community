import 'package:community/gen/assets.gen.dart';
import 'package:community/responsive_layout_builder.dart';
import 'package:community/widgets/explain_items.dart';
import 'package:community/widgets/features.dart';
import 'package:community/widgets/footer.dart';
import 'package:community/widgets/social.dart';
import 'package:community/widgets/youtube_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

enum MenuItem { events, documents }

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(builder: (context, layout, width) {
      return Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF42A5F5),
                      Color(0xFF3023AE),
                    ],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'O',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              const Text(
                'Osaka',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          centerTitle: false,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: buildActions(context, layout, width),
        ),
        body: Stack(
          children: const [
            Body(),
          ],
        ),
      );
    });
  }

  List<Widget> buildActions(
      BuildContext context, ResponsiveLayout layout, double width) {
    if (layout == ResponsiveLayout.slim) {
      return buildPopupMenuButton(context);
    } else {
      return buildActionButtons(context);
    }
  }

  List<Widget> buildPopupMenuButton(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return [
      PopupMenuButton<MenuItem>(
        icon: const Icon(Icons.menu, color: Colors.black),
        onSelected: (MenuItem result) async {
          String urlString;
          switch (result) {
            case MenuItem.events:
              urlString = 'https://flutter-jp.connpass.com/';
              break;
            case MenuItem.documents:
              urlString = 'https://flutter-osaka-dev.github.io/osaka/';
              break;
          }
          await launch(
            urlString,
            webOnlyWindowName: '_blank',
          );
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuItem>>[
          PopupMenuItem<MenuItem>(
            value: MenuItem.events,
            child: Text(appLocalizations.events),
          ),
          PopupMenuItem<MenuItem>(
            value: MenuItem.documents,
            child: Text(appLocalizations.documents),
          ),
        ],
      )
    ];
  }

  List<Widget> buildActionButtons(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return [
      Container(
        margin: const EdgeInsets.all(8),
        child: Tooltip(
          message: appLocalizations.events,
          child: TextButton(
            onPressed: () async {
              await launch(
                'https://flutter-jp.connpass.com/',
                webOnlyWindowName: '_blank',
              );
            },
            child: Text(appLocalizations.events),
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.all(8),
        child: Tooltip(
          message: appLocalizations.documents,
          child: TextButton(
            onPressed: () async {
              await launch(
                'https://flutter-osaka-dev.github.io/osaka',
                webOnlyWindowName: '_blank',
              );
            },
            child: Text(appLocalizations.documents),
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.all(8),
        width: 96,
        height: 24,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF42A5F5),
              Color(0xFF3023AE),
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF6078ea).withOpacity(.3),
              offset: const Offset(0, 8),
              blurRadius: 8,
            ),
          ],
        ),
        child: Material(
            color: Colors.transparent,
            child: Center(
              child: InkWell(
                child: Text(
                  appLocalizations.joinSlack,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat-Bold',
                  ),
                ),
                onTap: () async {
                  const url =
                      'https://join.slack.com/t/flutter-osaka/shared_invite/enQtODg3NTMxNTg4Njg5LTBhY2ZiMWFhOTI3NjZmN2IwZTc1MWY1Yzc3ODQ4NGRhYzQyNWM0NTg2NzY3OWEwNjk2MmMxMzQ4ZjFmNTZhNTI';
                  if (await canLaunch(url)) {
                    await launch(url);
                  }
                },
              ),
            )),
      )
    ];
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  TextStyle get titleTextStyle => const TextStyle(fontSize: 64);

  TextStyle get subtitleTextStyle => const TextStyle(fontSize: 36);

  int get logoWidth => 960;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return ResponsiveLayoutBuilder(builder: (context, layout, width) {
      final sizeFactor = (layout == ResponsiveLayout.slim) ? 0.6 : 1.0;

      return CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        Assets.flutterMeetupOsakaLogo,
                        width: logoWidth * sizeFactor,
                      ),
                      const Gap(16),
                      const ExplainItems(),
                      const Gap(16),
                      if (SHOW_YOUTUBE) YouTubeInfo(),
                      const Social(),
                    ],
                  ),
                ),
                const Spacer(),
                const Footer(),
              ],
            ),
          )
        ],
      );
    });
  }
}
