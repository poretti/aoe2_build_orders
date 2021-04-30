import 'package:aoe_flash_cards/build_orders/build_order_data.dart';
import 'package:aoe_flash_cards/enums/age.dart';
import 'package:aoe_flash_cards/enums/build_type.dart';
import 'package:aoe_flash_cards/enums/difficulty.dart';
import 'package:aoe_flash_cards/enums/resource.dart';
import 'package:aoe_flash_cards/constants.dart';

// Hera shows the Build Order PDF at 1:30
// https://www.youtube.com/watch?v=rfifcVq-wME

var scoutsIntoKnights = BuildOrderData(
  id: 'scoutsIntoKnightsHera',
  title: 'Scouts into Knights',
  author: 'Hera',
  image: 'assets/units/scout.png',
  description:
      'The Scout rush is a classic Build Order and a great place to start for beginners. '
      'This version has you transition into Knights, whereas other versions may go archers or skirms.\n\n'
      'The goal is to apply pressure with your Scouts in Feudal, utilizing your Scout\'s '
      'speed to harass villagers, and then increasing pressure in Castle Age with Knights.',
  timeToComplete: '19:00',
  mainType: BuildType.FastFeudal,
  difficulty: Difficulty.Intermediate,
  ageEndPopCount: {
    // Includes Scout
    Age.Dark: 21, // 20 vils
    Age.Feudal: 34, // 33 vils
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
        description: '3 on ${Strings.wood}',
        gameData: GameData(
          gameWord: Strings.wood,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 3,
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
          Resource.Wood: 3,
          Resource.Food: 7,
        },
      ),
      BuildOrderStep.dark(
        description: '1 more on ${Strings.boar}',
        gameData: GameData(
          gameWord: Strings.boar,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 3,
          Resource.Food: 8,
        },
      ),
      BuildOrderStep.dark(
        description: 'House + ${Strings.mill}',
        gameData: GameData(
          gameWord: Strings.mill,
          type: GameWordType.Building,
        ),
        vilCount: {
          Resource.Wood: 3,
          Resource.Food: 9,
        },
      ),
      BuildOrderStep.dark(
        description: '2 more on ${Strings.berries}',
        gameData: GameData(
          gameWord: Strings.berries,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 3,
          Resource.Food: 11,
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
        description: '2 more on ${Strings.boar}',
        gameData: GameData(
          gameWord: Strings.boar,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 3,
          Resource.Food: 13,
        },
      ),
      BuildOrderStep.dark(
        description: 'House + 1 more on ${Strings.berries}',
        gameData: GameData(
          gameWord: Strings.berries,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 3,
          Resource.Food: 14,
        },
      ),
      BuildOrderStep.dark(
        description: '2nd ${Strings.lumberCamp}',
        gameData: GameData(
          gameWord: Strings.lumberCamp,
          type: GameWordType.Building,
        ),
        vilCount: {
          Resource.Wood: 4,
          Resource.Food: 14,
        },
      ),
      BuildOrderStep.dark(
        description: '2 more on ${Strings.wood}',
        gameData: GameData(
          gameWord: Strings.wood,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 6,
          Resource.Food: 14,
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
        startTime: '7:30',
        gameData: GameData(
          gameWord: Strings.feudalAge,
          type: GameWordType.Tech,
        ),
      ),
      BuildOrderStep.dark(
        description: '3 from Boar/Sheep $arrow 2nd ${Strings.lumberCamp}',
        gameData: GameData(
          gameWord: Strings.lumberCamp,
          type: GameWordType.Building,
        ),
        vilCount: {
          Resource.Wood: 9,
          Resource.Food: 11,
        },
      ),
      BuildOrderStep.dark(
        description: 'Build ${Strings.barracks} + House',
        gameData: GameData(
          gameWord: Strings.barracks,
          type: GameWordType.Building,
        ),
      ),
    ],
    Age.Feudal: [
      BuildOrderStep.feudal(
        description: 'Research ${Strings.horseCollar}',
        gameData: GameData(
          gameWord: Strings.horseCollar,
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
        description: 'Build ${Strings.stable} (make 5 Scouts) + 2 Houses',
        gameData: GameData(
          gameWord: Strings.stable,
          type: GameWordType.Building,
        ),
      ),
      BuildOrderStep.dark(
        description: '7 from Boar/Sheep $arrow ${Strings.farms} (as Wood becomes available)',
        gameData: GameData(
          gameWord: Strings.farms,
          type: GameWordType.Resource,
        ),
      ),
      BuildOrderStep.feudal(
        description: '8 on ${Strings.farms} (as Wood becomes available)',
        gameData: GameData(
          gameWord: Strings.farms,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 9,
          Resource.Food: 19,
        },
      ),
      BuildOrderStep.feudal(
        description: '5 on ${Strings.gold}',
        gameData: GameData(
          gameWord: Strings.gold,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 9,
          Resource.Food: 19,
          Resource.Gold: 5,
        },
      ),
      BuildOrderStep.feudal(
        description: 'Research ${Strings.wheelbarrow}',
        gameData: GameData(
          gameWord: Strings.wheelbarrow,
          type: GameWordType.Tech,
        ),
      ),
      BuildOrderStep.feudal(
        description: 'Build ${Strings.blacksmith}',
        gameData: GameData(
          gameWord: Strings.blacksmith,
          type: GameWordType.Building,
        ),
      ),
      BuildOrderStep.feudal(
        description: 'Research ${Strings.castleAge}',
        startTime: '16:20',
        gameData: GameData(
          gameWord: Strings.castleAge,
          type: GameWordType.Tech,
        ),
      ),
      BuildOrderStep.feudal(
        description: 'Research ${Strings.scaleBardingArmor}',
        gameData: GameData(
          gameWord: Strings.scaleBardingArmor,
          type: GameWordType.Tech,
        ),
      ),
      BuildOrderStep.feudal(
        description: 'Research ${Strings.goldMining}',
        gameData: GameData(
          gameWord: Strings.goldMining,
          type: GameWordType.Tech,
        ),
      ),
      BuildOrderStep.feudal(
        description: 'Research ${Strings.bloodlines}',
        gameData: GameData(
          gameWord: Strings.bloodlines,
          type: GameWordType.Tech,
        ),
      ),
      BuildOrderStep.feudal(
        description: 'House + Build 2nd ${Strings.stable}',
        gameData: GameData(
          gameWord: Strings.stable,
          type: GameWordType.Building,
        ),
      ),
    ],
    Age.Castle: [
      BuildOrderStep.castle(
        description: 'Make ${Strings.knights}!',
        gameData: GameData(
          gameWord: Strings.knights,
          type: GameWordType.Unit,
        ),
      ),
      BuildOrderStep.castle(
        description: 'Build ${Strings.townCenter} on Wood and Gold',
        gameData: GameData(
          gameWord: Strings.townCenter,
          type: GameWordType.Building,
        ),
      ),
    ]
  },
);
