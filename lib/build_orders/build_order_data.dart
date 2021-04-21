import '../enums/build_type.dart';
import '../enums/difficulty.dart';
import '../enums/age.dart';
import '../enums/resource.dart';

class BuildOrderData {
  final String id;
  final String title;
  final String? author;
  final String image;
  final String description;
  final String timeToComplete;
  final BuildType mainType;
  final List<BuildType> types;
  final Difficulty difficulty;
  final Map<Age, int> ageEndPopCount;
  final Map<Age, List<BuildOrderStep>> steps;

  const BuildOrderData({
    required this.id,
    required this.title,
    this.author,
    required this.image,
    required this.description,
    required this.timeToComplete,
    required this.mainType,
    this.types = const [],
    required this.difficulty,
    required this.ageEndPopCount,
    required this.steps,
  });
}

// Try this when Dart 2.13 is released
// typedef Vils = int;

class BuildOrderStep {
  final Age age;
  final String description;
  final String? startTime;
  final GameData? gameData;
  final Map<Resource, int> vilCount;

  const BuildOrderStep({
    required this.age,
    required this.description,
    this.startTime,
    this.gameData,
    this.vilCount = const {},
  });

  const BuildOrderStep.dark({
    required this.description,
    this.startTime,
    this.gameData,
    this.vilCount = const {},
  }) : age = Age.Dark;

  const BuildOrderStep.feudal({
    required this.description,
    this.startTime,
    this.gameData,
    this.vilCount = const {},
  }) : age = Age.Feudal;

  const BuildOrderStep.castle({
    required this.description,
    this.startTime,
    this.gameData,
    this.vilCount = const {},
  }) : age = Age.Castle;
}

class GameData {
  final String gameWord;
  final GameWordType type;

  const GameData({required this.gameWord, required this.type});
}

enum GameWordType {
  Resource,
  Tech,
  Building,
}