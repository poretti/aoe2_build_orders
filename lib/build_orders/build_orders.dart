import 'package:collection/collection.dart';
import 'package:aoe_flash_cards/build_orders/build_order_data.dart';
import 'package:aoe_flash_cards/enums/age.dart';
import 'package:aoe_flash_cards/enums/build_type.dart';
import 'package:aoe_flash_cards/enums/difficulty.dart';
import 'package:aoe_flash_cards/enums/resource.dart';
import 'p22_maa_archers_cicero.dart';

class BuildOrders {
  final _buildOrders = [
    _fastCastleByArtOfWar,
    p22MaaArchersCicero,
  ];

  static final BuildOrders _singleton = BuildOrders._internal();
  factory BuildOrders() {
    return _singleton;
  }
  BuildOrders._internal();

  Map<BuildType, List<BuildOrderData>> get buildOrders {
    return groupBy(_buildOrders, (bo) => bo.mainType);
  }
}

var _fastCastleByArtOfWar = BuildOrderData(
  id: 'fastCastleByArtOfWar',
  title: 'Fast Castle',
  author: 'Art of War',
  image: 'assets/artofwar.png',
  description:
      'The fast castle build order from the Art of War tutorial. The goal is to reach the Castle Age as fast as possible.',
  timeToComplete: '16:05',
  mainType: BuildType.FastCastle,
  difficulty: Difficulty.Easy,
  ageEndPopCount: {
    Age.Dark: 28,
    Age.Feudal: 30,
  },
  steps: {
    Age.Dark: [
      BuildOrderStep.dark(
        description: '2 Houses + 6 on Sheep',
        vilCount: {
          Resource.Food: 6,
        },
      ),
      BuildOrderStep.dark(
        description: '4 on Wood',
        vilCount: {
          Resource.Wood: 4,
          Resource.Food: 6,
        },
      ),
      BuildOrderStep.dark(
        description: '1 lures Boar',
        vilCount: {
          Resource.Wood: 4,
          Resource.Food: 7,
        },
      ),
      BuildOrderStep.dark(
        description: 'House + Mill',
        vilCount: {
          Resource.Wood: 4,
          Resource.Food: 8,
        },
      ),
      BuildOrderStep.dark(
        description: '2 more on Berries',
        vilCount: {
          Resource.Wood: 4,
          Resource.Food: 10,
        },
      ),
      BuildOrderStep.dark(
        description: '1 lures Boar',
        vilCount: {
          Resource.Wood: 4,
          Resource.Food: 11,
        },
      ),
      BuildOrderStep.dark(
        description: 'House + 3 on Berries',
        vilCount: {
          Resource.Wood: 4,
          Resource.Food: 14,
        },
      ),
      BuildOrderStep.dark(
        description: '1 on Wood',
        vilCount: {
          Resource.Wood: 5,
          Resource.Food: 14,
        },
      ),
      BuildOrderStep.dark(
        description: '2nd Lumber Camp',
        vilCount: {
          Resource.Wood: 6,
          Resource.Food: 14,
        },
      ),
      BuildOrderStep.dark(
        description: 'House + 4 on Wood',
        vilCount: {
          Resource.Wood: 10,
          Resource.Food: 14,
        },
      ),
      BuildOrderStep.dark(
        description: '3 on Gold',
        vilCount: {
          Resource.Wood: 10,
          Resource.Food: 14,
          Resource.Gold: 3,
        },
      ),
      BuildOrderStep.dark(
        description: '8 from Boar/Sheep → Seed 8 Farms',
        vilCount: {
          Resource.Wood: 10,
          Resource.Food: 14,
        },
      ),
      BuildOrderStep.dark(
        description: 'Research Loom',
      ),
      BuildOrderStep.dark(
        description: 'Research Feudal Age',
        startTime: '10:25',
      ),
    ],
    Age.Feudal: [
      BuildOrderStep.feudal(
        description: 'Build Market (using 2 from Gold)',
        vilCount: {
          Resource.Wood: 10,
          Resource.Food: 14,
          Resource.Gold: 1,
          Resource.Builder: 2,
        },
      ),
      BuildOrderStep.feudal(
        description: 'Build Blacksmith (using 1 from Gold)',
        vilCount: {
          Resource.Wood: 10,
          Resource.Food: 14,
          Resource.Gold: 0,
          Resource.Builder: 3,
        },
      ),
      BuildOrderStep.feudal(
        description: 'Queue 2 on Wood',
        vilCount: {
          Resource.Wood: 12,
          Resource.Food: 14,
          Resource.Gold: 3,
        },
      ),
      BuildOrderStep.feudal(
        description: 'Research Castle Age',
        startTime: '13:25',
      ),
      BuildOrderStep.feudal(
        description: '6 from Berries → 6 Farms',
        vilCount: {
          Resource.Wood: 12,
          Resource.Food: 14,
          Resource.Gold: 3,
        },
      ),
    ]
  },
);
