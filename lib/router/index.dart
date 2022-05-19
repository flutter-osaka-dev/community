import 'package:community/pages/index.dart';
import 'package:community/router/simple_route.dart';
import 'package:flutter/material.dart';

Route<dynamic> buildRouters(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return defaultRoute();
    default:
      return defaultRoute();
  }
}

SimpleRoute defaultRoute() {
  return SimpleRoute(
    name: '/',
    title: 'Flutter Osaka',
    builder: (context) => const IndexPage(),
  );
}
