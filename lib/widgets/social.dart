import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkModel {
  LinkModel(this.name, this.url);

  final String name;
  final String url;
}

class Social extends StatelessWidget {
  const Social({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final socialLinks = <Map<String, String>>[
      {
        'name': 'github_logo',
        'url': 'https://github.com/flutter-osaka-dev',
      },
      {
        'name': 'connpass_logo',
        'url': 'https://flutter-jp.connpass.com/',
      },
      {
        'name': 'meetup_com_logo',
        'url': 'https://meetup.com/ja-JP/flutter-meetup-osaka',
      },
    ];

    List<Widget> socialItem() {
      return socialLinks.map((link) {
        return IconButton(
          tooltip: link['url'],
          icon: SvgPicture.asset(
            '/${link['name']}.svg',
            width: 60,
          ),
          onPressed: () async {
            await launch(link['url']!);
          },
          mouseCursor: SystemMouseCursors.click,
        );
      }).toList();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[...socialItem()],
    );
  }
}
