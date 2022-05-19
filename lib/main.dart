import 'package:community/router/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
    const FlutterOsakaWebsite(),
  );
}

class FlutterOsakaWebsite extends StatelessWidget {
  const FlutterOsakaWebsite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Osaka',
      theme: ThemeData(fontFamily: 'Montserrat'),
      onGenerateRoute: buildRouters,
      initialRoute: '/',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
