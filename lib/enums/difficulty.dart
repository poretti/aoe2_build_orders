import 'package:flutter/material.dart';

enum Difficulty {
  Easy,
  Intermediate,
  Advanced,
  Expert,
}

extension DifficultyExtension on Difficulty {
  static const imageWidth = 20.0;
  static final image = Image.asset(
    'assets/difficulties/sword7.png',
    width: imageWidth,
    color: Colors.grey[600],
    colorBlendMode: BlendMode.srcATop,
  );

  Widget get widget {
    switch (this) {
      case Difficulty.Easy:
        return _numberOfImages(1);
      case Difficulty.Intermediate:
        return _numberOfImages(2);
      case Difficulty.Advanced:
        return _numberOfImages(3);
      case Difficulty.Expert:
        return _numberOfImages(4);
      default:
        return _numberOfImages(0);
    }
  }

  Widget _numberOfImages(int num) {
    final images = List.generate(
      num,
      (index) => PositionedDirectional(
        // offset images so the swords are more tightly grouped
        end: index * (imageWidth - 10),
        child: image,
      ),
    );

    return Container(
      width: 60,
      child: Stack(
        alignment: Alignment.center,
        children: images,
      ),
    );
  }
}
