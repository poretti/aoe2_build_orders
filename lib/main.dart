import 'package:flutter/material.dart';
import 'theme_data.dart';
import 'constants.dart';
import 'pages/home_page.dart';
import 'pages/summary_page.dart';
import 'pages/drag_n_drop_game.dart';

void main() {
  runApp(AoeFlashCardsApp());
}

class AoeFlashCardsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: themeData,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        BuildOrderSummary.routeName: (context) => BuildOrderSummary(),
        DragNDropPage.routeName: (context) => DragNDropPage(),
      },
    );
  }
}
