import 'package:community/widgets/custom_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExplainItems extends StatelessWidget {
  const ExplainItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return Container(
      alignment: Alignment.center,
      height: 160,
      padding: const EdgeInsets.all(4),
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 80,
            child: Column(
              children: [
                CustomTypography.heading(appLocalizations.organization,
                    type: 'heading', textAlign: TextAlign.center),
                CustomTypography.body(appLocalizations.organization_detail,
                    type: 'body', textAlign: TextAlign.center),
              ],
            ),
          ),
          SizedBox(
            height: 80,
            child: Column(
              children: [
                CustomTypography.heading(appLocalizations.activities,
                    type: 'heading', textAlign: TextAlign.center),
                CustomTypography.body(appLocalizations.activities_detail,
                    type: 'body', textAlign: TextAlign.center),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
