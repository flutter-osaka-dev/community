import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final footerLinks = <Map<String, String>>[
      {
        'name': appLocalizations.codeOfConduct,
        'url': 'https://flutterjp-osaka.github.io/Code-of-Conduct/',
      },
    ];

    final footerItem = footerLinks.map((link) {
      return _FooterButton(
          message: link['name']!,
          text: link['name']!,
          onPressed: () async {
            await launch(link['url']!);
          });
    }).toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Wrap(
          alignment: WrapAlignment.center,
          children: footerItem,
        ),
        const Gap(8),
        Text(appLocalizations.copyright),
        const Gap(32),
      ],
    );
  }
}

class _FooterButton extends StatelessWidget {
  const _FooterButton({
    Key? key,
    required this.message,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String message;
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
