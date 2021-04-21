import 'package:aoe_flash_cards/build_orders/build_order_data.dart';
import 'package:aoe_flash_cards/enums/age.dart';
import 'package:aoe_flash_cards/enums/build_type.dart';
import 'package:aoe_flash_cards/enums/difficulty.dart';
import 'package:aoe_flash_cards/enums/resource.dart';
import 'package:aoe_flash_cards/constants.dart';

// Interactive Build Order Guide | 22 Pop Man at Arms - Archers [A+ Demonstration]
// https://www.youtube.com/watch?v=_SxgC6bW4ZY

var p22MaaArchersCicero = BuildOrderData(
  id: 'p22MaaArchersCicero',
  title: '22p Man-at-Arms into Archers',
  author: 'Cicero',
  image: 'assets/units/man-at-arms.png',
  description:
      'Man-at-Arms will help you buy time to mass archers. You\'ll want to make 20 archers in total for Cicero\'s Interactive Build Order.\n\n'
      'During the Feudal age you\'ll make a lot of farms, use straggler trees next to your Town Center if a to-be-farmer is waiting for Wood.',
  timeToComplete: '21:30',
  mainType: BuildType.FastFeudal,
  difficulty: Difficulty.Advanced,
  ageEndPopCount: {
    Age.Dark: 22,
    Age.Feudal: 40,
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
        description: '1 lure Boar',
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
        description: 'Lure Boar (using Boar-eating vil)',
      ),
      BuildOrderStep.dark(
        description: '2 on Berries',
        vilCount: {
          Resource.Wood: 4,
          Resource.Food: 12,
        },
      ),
      BuildOrderStep.dark(
        description: 'House (with 1 from Berries)',
      ),
      BuildOrderStep.dark(
        description: '2 more on Boar',
        vilCount: {
          Resource.Wood: 4,
          Resource.Food: 14,
        },
      ),
      BuildOrderStep.dark(
        description: 'Build Barracks',
        vilCount: {
          Resource.Wood: 4,
          Resource.Food: 14,
          Resource.Builder: 1,
        },
      ),
      BuildOrderStep.dark(
        description: '2 on Gold',
        vilCount: {
          Resource.Wood: 4,
          Resource.Food: 14,
          Resource.Gold: 2,
          Resource.Builder: 1,
        },
      ),
      BuildOrderStep.dark(
        description: 'Research Loom',
      ),
      BuildOrderStep.dark(
          description: 'Research Feudal Age', startTime: '7:55'),
      BuildOrderStep.dark(
        description: 'House (using Barracks vil)',
      ),
      BuildOrderStep.dark(
        description: '4 from Boar/Sheep $arrow 2nd Lumber Camp',
        vilCount: {
          Resource.Wood: 8,
          Resource.Food: 10,
          Resource.Gold: 2,
          Resource.Builder: 1,
        },
      ),
      BuildOrderStep.dark(
        description: 'Make 3 Militia',
      ),
      BuildOrderStep.dark(
        description: 'Barracks/House vil $arrow Sheep',
        vilCount: {
          Resource.Wood: 8,
          Resource.Food: 11,
          Resource.Gold: 2,
        },
      ),
      BuildOrderStep.dark(
        description: '2 from Boar/Sheep $arrow Seed 2 Farms',
      ),
    ],
    Age.Feudal: [
      BuildOrderStep.feudal(
        description: 'Research Man-at-Arms',
      ),
      BuildOrderStep.feudal(
        description: 'Research Double-bit Axe',
      ),
      BuildOrderStep.feudal(
        description: '1 on Wood',
        vilCount: {
          Resource.Wood: 9,
          Resource.Food: 11,
          Resource.Gold: 2,
        },
      ),
      BuildOrderStep.feudal(
        description: '2 from Boar/Sheep $arrow Seed 2 Farms',
      ),
      BuildOrderStep.feudal(
        description: '2 from Boar/Sheep $arrow Wood',
        vilCount: {
          Resource.Wood: 11,
          Resource.Food: 9,
          Resource.Gold: 2,
        },
      ),
      BuildOrderStep.feudal(
        description: '1 on Wood',
        vilCount: {
          Resource.Wood: 12,
          Resource.Food: 9,
          Resource.Gold: 2,
        },
      ),
      BuildOrderStep.feudal(
        description: '1 on Gold',
        vilCount: {
          Resource.Wood: 12,
          Resource.Food: 9,
          Resource.Gold: 3,
        },
      ),
      BuildOrderStep.feudal(
        description: 'House (using 1 vil from Wood)',
      ),
      BuildOrderStep.feudal(
        description: 'Build Range (using 1 vil from Berries)',
        vilCount: {
          Resource.Wood: 12,
          Resource.Food: 8,
          Resource.Gold: 3,
          Resource.Builder: 1,
        },
      ),
      BuildOrderStep.feudal(
        description: '2 on Gold',
        vilCount: {
          Resource.Wood: 12,
          Resource.Food: 8,
          Resource.Gold: 5,
          Resource.Builder: 1,
        },
      ),
      BuildOrderStep.feudal(
        description: 'Build Range & Make Archers (using 1 vil from Berries)',
        vilCount: {
          Resource.Wood: 12,
          Resource.Food: 7,
          Resource.Gold: 5,
          Resource.Builder: 2,
        },
      ),
      BuildOrderStep.feudal(
        description: '2 on Gold',
        vilCount: {
          Resource.Wood: 12,
          Resource.Food: 7,
          Resource.Gold: 7,
          Resource.Builder: 2,
        },
      ),
      BuildOrderStep.feudal(
        description: 'Range builders $arrow Berries (again)',
        vilCount: {
          Resource.Wood: 12,
          Resource.Food: 9,
          Resource.Gold: 7,
        },
      ),
      BuildOrderStep.feudal(
        description: 'Build Blacksmith (using vil from Wood)',
        vilCount: {
          Resource.Wood: 11,
          Resource.Food: 9,
          Resource.Gold: 7,
          Resource.Builder: 1,
        },
      ),
      BuildOrderStep.feudal(
        description: '1 on Gold',
        vilCount: {
          Resource.Wood: 11,
          Resource.Food: 9,
          Resource.Gold: 8,
          Resource.Builder: 1,
        },
      ),
      BuildOrderStep.feudal(
        description: 'House (using Blacksmith vil) $arrow Wood',
        vilCount: {
          Resource.Wood: 12,
          Resource.Food: 9,
          Resource.Gold: 8,
        },
      ),
      BuildOrderStep.feudal(
        description: '2 from Berries $arrow Seed 2 Farms',
      ),
      BuildOrderStep.feudal(
        description: '2 seed Farm',
        vilCount: {
          Resource.Wood: 12,
          Resource.Food: 11,
          Resource.Gold: 8,
        },
      ),
      BuildOrderStep.feudal(
        description: '2 Houses (using 1 from Berries)',
        vilCount: {
          Resource.Wood: 12,
          Resource.Food: 10,
          Resource.Gold: 8,
          Resource.Builder: 1,
        },
      ),
      BuildOrderStep.feudal(
        description: '1 seed Farm',
        vilCount: {
          Resource.Wood: 12,
          Resource.Food: 11,
          Resource.Gold: 8,
          Resource.Builder: 1,
        },
      ),
      BuildOrderStep.feudal(
        description: '2 from Berries $arrow Seed 2 Farms',
      ),
      BuildOrderStep.feudal(
        description: 'House builder (from Berries) $arrow Wood',
        vilCount: {
          Resource.Wood: 13,
          Resource.Food: 11,
          Resource.Gold: 8,
        },
      ),
      BuildOrderStep.feudal(
        description: '4 seed Farm',
        vilCount: {
          Resource.Wood: 13,
          Resource.Food: 15,
          Resource.Gold: 8,
        },
      ),
      BuildOrderStep.feudal(
        description: '2 Houses (using 1 from Wood)',
      ),
      BuildOrderStep.feudal(
          description: 'Research Wheelbarrow', startTime: '16:20'),
      BuildOrderStep.feudal(
        description: '1 from Wood $arrow Seed Farm',
        vilCount: {
          Resource.Wood: 12,
          Resource.Food: 16,
          Resource.Gold: 8,
        },
      ),
      BuildOrderStep.feudal(
        description: '3 on Wood',
        vilCount: {
          Resource.Wood: 15,
          Resource.Food: 16,
          Resource.Gold: 8,
        },
      ),
      BuildOrderStep.feudal(
          description: 'Research Castle Age', startTime: '19:00'),
    ]
  },
);
