import 'package:flutter/material.dart';

enum Resource {
  Wood,
  Food,
  Gold,
  Stone,
  Builder,
}

extension ResourceExtension on Resource {
  static final assetPath = 'assets/resources/';

  String _imageName() {
    switch (this) {
      case Resource.Wood:
        return 'wood';
      case Resource.Food:
        return 'food';
      case Resource.Gold:
        return 'gold';
      case Resource.Stone:
        return 'stone';
      case Resource.Builder:
        return 'builder';
    }
  }

  Image get image => Image.asset(assetPath + _imageName() + '.png');
}
