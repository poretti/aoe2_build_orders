import 'package:flutter/material.dart';

enum Difficulty {
  Easy,
  Intermediate,
  Advanced,
  Expert,
}

extension DifficultyExtension on Difficulty {
  static const imageWidth = 20.0;
  static const imageOffset = 10.0;
  static final image = Image.asset(
    'assets/difficulties/sword7.png',
    width: imageWidth,
    color: Colors.grey[600],
    colorBlendMode: BlendMode.srcATop,
  );

  String get name {
    switch (this) {
      case Difficulty.Easy:
        return 'Easy';
      case Difficulty.Intermediate:
        return 'Intermediate';
      case Difficulty.Advanced:
        return 'Advanced';
      case Difficulty.Expert:
        return 'Expert';
    }
  }

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
    }
  }

  Widget _numberOfImages(int num) {
    final images = List.generate(
      num,
      (index) => PositionedDirectional(
        // offset images so the swords are more tightly grouped
        end: index * (imageWidth - imageOffset),
        child: image,
      ),
    );

    // Always have at least 1 image, plus a smaller amount for each addtl image
    var width = imageWidth + (imageWidth - imageOffset) * (num - 1);

    return Container(
      width: width,
      child: Stack(
        alignment: Alignment.center,
        children: images,
      ),
    );
  }
}
