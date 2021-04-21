import 'package:flutter/material.dart';

enum Age {
  Dark,
  Feudal,
  Castle,
  Imperial,
}

extension AgeExtension on Age {
  static final assetPath = 'assets/ages/';

  String _squareIconName() {
    switch (this) {
      case Age.Dark:
        return 'age-1';
      case Age.Feudal:
        return 'age-2';
      case Age.Castle:
        return 'age-3';
      case Age.Imperial:
        return 'age-4';
    }
  }

  String _shieldIconName() {
    switch (this) {
      case Age.Dark:
        return 'dark-age';
      case Age.Feudal:
        return 'feudal-age';
      case Age.Castle:
        return 'castle-age';
      case Age.Imperial:
        return 'imperial-age';
    }
  }

  Image get squareIcon => Image.asset(assetPath + _squareIconName() + '.png');

  Image get shieldIcon => Image.asset(assetPath + _shieldIconName() + '.png');

  String get name {
    switch (this) {
      case Age.Dark:
        return 'Dark Age';
      case Age.Feudal:
        return 'Feudal Age';
      case Age.Castle:
        return 'Castle Age';
      case Age.Imperial:
        return 'Imperial Age';
    }
  }

  Age? get nextAge {
    switch (this) {
      case Age.Dark:
        return Age.Feudal;
      case Age.Feudal:
        return Age.Castle;
      case Age.Castle:
        return Age.Imperial;
      case Age.Imperial:
        return null;
    }
  }
}
