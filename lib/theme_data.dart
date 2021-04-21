import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final superDuperSpecialFont = GoogleFonts.dellaRespira();

final themeData = ThemeData(
  primaryColor: ColorsExt.backgroundColor,
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
      color: Colors.grey[850],
      iconTheme: IconThemeData(
        color: ColorsExt.appBarHoneyYellow,
      )),
  textTheme: GoogleFonts.latoTextTheme()
      // For some reason copyWith must go first so the 'apply' is respected.
      .copyWith(bodyText2: TextStyle(fontStyle: FontStyle.italic))
      .apply(
        displayColor: Colors.grey[600], // The app bar header
        bodyColor: Colors.grey[600],
      ),
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    color: Colors.white,
  ),
  iconTheme: IconThemeData(color: ColorsExt.iconColor),
);

class ColorsExt {
  // See link for color palette
  // https://coolors.co/49948b-95b2b8-454545-bc3908-f6ae28

  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  ColorsExt._();

  static const _rustPrimaryColor = 0xFFBC3908;
  static const rust = MaterialColor(
    _rustPrimaryColor,
    <int, Color>{
      50: Color(0xFFfbb69d),
      100: Color(0xFFf99976),
      200: Color(0xFFf87c4f),
      300: Color(0xFFf65f28),
      400: Color(0xFFeb460a),
      500: Color(_rustPrimaryColor),
      600: Color(0xFF9d2f07),
      700: Color(0xFF762305),
      800: Color(0xFF4e1703),
      900: Color(0xFF270c02),
    },
  );

  static const polishedPine = Color(0xFF49948b);
  static const pewterBlue = Color(0xFF95B2B8);
  static const onyx = Color(0xFF454545);

  static const _honeyYellowPrimaryColor = 0xFFF6AE2D;
  static const honeyYellow = MaterialColor(
    _honeyYellowPrimaryColor,
    <int, Color>{
      50: Color(0xFFfef8eb),
      100: Color(0xFFfdf0d8),
      200: Color(0xFFfce1b1),
      300: Color(0xFFfad389),
      400: Color(0xFFf8c462),
      450: Color(0xFFf6b02c),
      500: Color(_honeyYellowPrimaryColor),
      600: Color(0xFFf5a614),
      700: Color(0xFFd78f09),
      800: Color(0xFFb07507),
      900: Color(0xFF895b06),
    },
  );

  static final appBarHoneyYellow = honeyYellow[450];
  static final backgroundColor = Colors.grey[200];
  static final iconColor = Colors.grey[600];
}
