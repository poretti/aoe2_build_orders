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
        description: '2 Houses + 6 on ${Strings.sheep}',
        gameData: GameData(
          gameWord: Strings.sheep,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Food: 6,
        },
      ),
      BuildOrderStep.dark(
        description: '4 on ${Strings.wood}',
        gameData: GameData(
          gameWord: Strings.wood,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 4,
          Resource.Food: 6,
        },
      ),
      BuildOrderStep.dark(
        description: '1 lure ${Strings.boar}',
        gameData: GameData(
          gameWord: Strings.boar,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 4,
          Resource.Food: 7,
        },
      ),
      BuildOrderStep.dark(
        description: 'House + ${Strings.mill}',
        gameData: GameData(
          gameWord: Strings.mill,
          type: GameWordType.Building,
        ),
        vilCount: {
          Resource.Wood: 4,
          Resource.Food: 8,
        },
      ),
      BuildOrderStep.dark(
        description: '2 more on ${Strings.berries}',
        gameData: GameData(
          gameWord: Strings.berries,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 4,
          Resource.Food: 10,
        },
      ),
      BuildOrderStep.dark(
        description: 'Lure ${Strings.boar} (using Boar-eating vil)',
        gameData: GameData(
          gameWord: Strings.boar,
          type: GameWordType.Resource,
        ),
      ),
      BuildOrderStep.dark(
        description: '2 on Berries',
        gameData: GameData(
          gameWord: Strings.berries,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 4,
          Resource.Food: 12,
        },
      ),
      BuildOrderStep.dark(
        description: 'House (with 1 from ${Strings.berries})',
        gameData: GameData(
          gameWord: Strings.berries,
          type: GameWordType.Resource,
        ),
      ),
      BuildOrderStep.dark(
        description: '2 more on ${Strings.boar}',
        gameData: GameData(
          gameWord: Strings.boar,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 4,
          Resource.Food: 14,
        },
      ),
      BuildOrderStep.dark(
        description: 'Build ${Strings.barracks}',
        gameData: GameData(
          gameWord: Strings.barracks,
          type: GameWordType.Building,
        ),
        vilCount: {
          Resource.Wood: 4,
          Resource.Food: 14,
          Resource.Builder: 1,
        },
      ),
      BuildOrderStep.dark(
        description: '2 on ${Strings.gold}',
        gameData: GameData(
          gameWord: Strings.gold,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 4,
          Resource.Food: 14,
          Resource.Gold: 2,
          Resource.Builder: 1,
        },
      ),
      BuildOrderStep.dark(
        description: 'Research ${Strings.loom}',
        gameData: GameData(
          gameWord: Strings.loom,
          type: GameWordType.Tech,
        ),
      ),
      BuildOrderStep.dark(
        description: 'Research ${Strings.feudalAge}',
        startTime: '7:55',
        gameData: GameData(
          gameWord: Strings.feudalAge,
          type: GameWordType.Tech,
        ),
      ),
      BuildOrderStep.dark(
        description: 'House (using ${Strings.barracks} vil)',
        gameData: GameData(
          gameWord: Strings.barracks,
          type: GameWordType.Building,
        ),
      ),
      BuildOrderStep.dark(
        description: '4 from Boar/Sheep $arrow 2nd ${Strings.lumberCamp}',
        gameData: GameData(
          gameWord: Strings.lumberCamp,
          type: GameWordType.Building,
        ),
        vilCount: {
          Resource.Wood: 8,
          Resource.Food: 10,
          Resource.Gold: 2,
          Resource.Builder: 1,
        },
      ),
      BuildOrderStep.dark(
        description: 'Make 3 ${Strings.militia}',
        gameData: GameData(
          gameWord: Strings.militia,
          type: GameWordType.Unit,
        ),
      ),
      BuildOrderStep.dark(
        description: 'Barracks/House vil $arrow ${Strings.sheep}',
        gameData: GameData(
          gameWord: Strings.sheep,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 8,
          Resource.Food: 11,
          Resource.Gold: 2,
        },
      ),
      BuildOrderStep.dark(
        description: '2 from Boar/Sheep $arrow Seed 2 ${Strings.farms}',
        gameData: GameData(
          gameWord: Strings.farms,
          type: GameWordType.Resource,
        ),
      ),
    ],
    Age.Feudal: [
      BuildOrderStep.feudal(
        description: 'Research ${Strings.manAtArms}',
        gameData: GameData(
          gameWord: Strings.manAtArms,
          type: GameWordType.Tech,
        ),
      ),
      BuildOrderStep.feudal(
        description: 'Research ${Strings.doubleBitAxe}',
        gameData: GameData(
          gameWord: Strings.doubleBitAxe,
          type: GameWordType.Tech,
        ),
      ),
      BuildOrderStep.feudal(
        description: '1 on ${Strings.wood}',
        gameData: GameData(
          gameWord: Strings.wood,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 9,
          Resource.Food: 11,
          Resource.Gold: 2,
        },
      ),
      BuildOrderStep.feudal(
        description: '2 from Boar/Sheep $arrow Seed 2 ${Strings.farms}',
        gameData: GameData(
          gameWord: Strings.farms,
          type: GameWordType.Resource,
        ),
      ),
      BuildOrderStep.feudal(
        description: '2 from Boar/Sheep $arrow ${Strings.wood}',
        gameData: GameData(
          gameWord: Strings.wood,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 11,
          Resource.Food: 9,
          Resource.Gold: 2,
        },
      ),
      BuildOrderStep.feudal(
        description: '1 on ${Strings.wood}',
        gameData: GameData(
          gameWord: Strings.wood,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 12,
          Resource.Food: 9,
          Resource.Gold: 2,
        },
      ),
      BuildOrderStep.feudal(
        description: '1 on ${Strings.gold}',
        gameData: GameData(
          gameWord: Strings.gold,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 12,
          Resource.Food: 9,
          Resource.Gold: 3,
        },
      ),
      BuildOrderStep.feudal(
        description: 'House (using 1 vil from ${Strings.wood})',
        gameData: GameData(
          gameWord: Strings.wood,
          type: GameWordType.Resource,
        ),
      ),
      BuildOrderStep.feudal(
        description: 'Build ${Strings.archeryRange} (using 1 vil from Berries)',
        gameData: GameData(
          gameWord: Strings.archeryRange,
          type: GameWordType.Building,
        ),
        vilCount: {
          Resource.Wood: 12,
          Resource.Food: 8,
          Resource.Gold: 3,
          Resource.Builder: 1,
        },
      ),
      BuildOrderStep.feudal(
        description: '2 on ${Strings.gold}',
        gameData: GameData(
          gameWord: Strings.gold,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 12,
          Resource.Food: 8,
          Resource.Gold: 5,
          Resource.Builder: 1,
        },
      ),
      BuildOrderStep.feudal(
        description:
            'Build ${Strings.archeryRange} & Make Archers (using 1 vil from Berries)',
        gameData: GameData(
          gameWord: Strings.archeryRange,
          type: GameWordType.Building,
        ),
        vilCount: {
          Resource.Wood: 12,
          Resource.Food: 7,
          Resource.Gold: 5,
          Resource.Builder: 2,
        },
      ),
      BuildOrderStep.feudal(
        description: '2 on ${Strings.gold}',
        gameData: GameData(
          gameWord: Strings.gold,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 12,
          Resource.Food: 7,
          Resource.Gold: 7,
          Resource.Builder: 2,
        },
      ),
      BuildOrderStep.feudal(
        description: 'Range builders $arrow ${Strings.berries} (again)',
        gameData: GameData(
          gameWord: Strings.berries,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 12,
          Resource.Food: 9,
          Resource.Gold: 7,
        },
      ),
      BuildOrderStep.feudal(
        description: 'Build ${Strings.blacksmith} (using vil from Wood)',
        gameData: GameData(
          gameWord: Strings.blacksmith,
          type: GameWordType.Building,
        ),
        vilCount: {
          Resource.Wood: 11,
          Resource.Food: 9,
          Resource.Gold: 7,
          Resource.Builder: 1,
        },
      ),
      BuildOrderStep.feudal(
        description: '1 on ${Strings.gold}',
        gameData: GameData(
          gameWord: Strings.gold,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 11,
          Resource.Food: 9,
          Resource.Gold: 8,
          Resource.Builder: 1,
        },
      ),
      BuildOrderStep.feudal(
        description: 'House (using Blacksmith vil) $arrow ${Strings.wood}',
        gameData: GameData(
          gameWord: Strings.wood,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 12,
          Resource.Food: 9,
          Resource.Gold: 8,
        },
      ),
      BuildOrderStep.feudal(
        description: '2 from Berries $arrow Seed 2 ${Strings.farms}',
        gameData: GameData(
          gameWord: Strings.farms,
          type: GameWordType.Resource,
        ),
      ),
      BuildOrderStep.feudal(
        description: '2 seed ${Strings.farms}',
        gameData: GameData(
          gameWord: Strings.farms,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 12,
          Resource.Food: 11,
          Resource.Gold: 8,
        },
      ),
      BuildOrderStep.feudal(
        description: '2 Houses (using 1 from ${Strings.berries})',
        gameData: GameData(
          gameWord: Strings.berries,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 12,
          Resource.Food: 10,
          Resource.Gold: 8,
          Resource.Builder: 1,
        },
      ),
      BuildOrderStep.feudal(
        description: '1 seed ${Strings.farms}',
        gameData: GameData(
          gameWord: Strings.farms,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 12,
          Resource.Food: 11,
          Resource.Gold: 8,
          Resource.Builder: 1,
        },
      ),
      BuildOrderStep.feudal(
        description: '2 from Berries $arrow Seed 2 ${Strings.farms}',
        gameData: GameData(
          gameWord: Strings.farms,
          type: GameWordType.Resource,
        ),
      ),
      BuildOrderStep.feudal(
        description: 'House builder (from Berries) $arrow ${Strings.wood}',
        gameData: GameData(
          gameWord: Strings.wood,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 13,
          Resource.Food: 11,
          Resource.Gold: 8,
        },
      ),
      BuildOrderStep.feudal(
        description: '4 seed ${Strings.farms}',
        gameData: GameData(
          gameWord: Strings.farms,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 13,
          Resource.Food: 15,
          Resource.Gold: 8,
        },
      ),
      BuildOrderStep.feudal(
        description: '2 Houses (using 1 from ${Strings.wood})',
        gameData: GameData(
          gameWord: Strings.wood,
          type: GameWordType.Resource,
        ),
      ),
      BuildOrderStep.feudal(
        description: 'Research ${Strings.wheelbarrow}',
        startTime: '16:20',
        gameData: GameData(
          gameWord: Strings.wheelbarrow,
          type: GameWordType.Tech,
        ),
      ),
      BuildOrderStep.feudal(
        description: '1 from ${Strings.wood} $arrow Seed Farm',
        gameData: GameData(
          gameWord: Strings.wood,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 12,
          Resource.Food: 16,
          Resource.Gold: 8,
        },
      ),
      BuildOrderStep.feudal(
        description: '3 on ${Strings.wood}',
        gameData: GameData(
          gameWord: Strings.wood,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 15,
          Resource.Food: 16,
          Resource.Gold: 8,
        },
      ),
      BuildOrderStep.feudal(
        description: 'Research ${Strings.castleAge}',
        startTime: '19:00',
        gameData: GameData(
          gameWord: Strings.castleAge,
          type: GameWordType.Tech,
        ),
      ),
    ]
  },
);
