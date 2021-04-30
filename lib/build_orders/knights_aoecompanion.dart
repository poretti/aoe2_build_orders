import 'package:aoe_flash_cards/build_orders/build_order_data.dart';
import 'package:aoe_flash_cards/enums/age.dart';
import 'package:aoe_flash_cards/enums/build_type.dart';
import 'package:aoe_flash_cards/enums/difficulty.dart';
import 'package:aoe_flash_cards/enums/resource.dart';
import 'package:aoe_flash_cards/constants.dart';

// https://aoecompanion.com/build-guides/fast-castle-knights

var knightsAoeCompanion = BuildOrderData(
  id: 'knightsAoeCompanion',
  title: 'Knights',
  author: 'AOE Companion',
  image: 'assets/units/knight.png',
  description:
  'The goal is to reach Castle Age as fast as possible and then start pumping out Knights.',
  timeToComplete: '15:40',
  mainType: BuildType.FastCastle,
  difficulty: Difficulty.Easy,
  ageEndPopCount: {
    // Includes Scout
    Age.Dark: 28, // 27 vils
    Age.Feudal: 30, // 29 vils
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
        description: '2 Houses + ${Strings.mill} + 3 on Berries',
        gameData: GameData(
          gameWord: Strings.mill,
          type: GameWordType.Building,
        ),
        vilCount: {
          Resource.Wood: 4,
          Resource.Food: 10,
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
          Resource.Food: 11,
        },
      ),
      BuildOrderStep.dark(
        description: '1 more on ${Strings.berries}',
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
        description: '2 on ${Strings.farms}',
        gameData: GameData(
          gameWord: Strings.farms,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 4,
          Resource.Food: 14,
        },
      ),
      BuildOrderStep.dark(
        description: '1 on ${Strings.wood}',
        gameData: GameData(
          gameWord: Strings.wood,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 5,
          Resource.Food: 14,
        },
      ),
      BuildOrderStep.dark(
        description: 'House + 2nd ${Strings.lumberCamp}',
        gameData: GameData(
          gameWord: Strings.lumberCamp,
          type: GameWordType.Building,
        ),
        vilCount: {
          Resource.Wood: 6,
          Resource.Food: 14,
        },
      ),
      BuildOrderStep.dark(
        description: '4 more on ${Strings.wood}',
        gameData: GameData(
          gameWord: Strings.wood,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 10,
          Resource.Food: 14,
        },
      ),
      BuildOrderStep.dark(
        description: '3 on ${Strings.gold}',
        gameData: GameData(
          gameWord: Strings.gold,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 10,
          Resource.Food: 14,
          Resource.Gold: 3,
        },
      ),
      BuildOrderStep.dark(
        description: 'Research ${Strings.feudalAge}',
        startTime: '10:00',
        gameData: GameData(
          gameWord: Strings.feudalAge,
          type: GameWordType.Tech,
        ),
      ),
      BuildOrderStep.dark(
        description: 'Build ${Strings.barracks}',
        gameData: GameData(
          gameWord: Strings.barracks,
          type: GameWordType.Building,
        ),
      ),
      BuildOrderStep.dark(
        description: '8 from Boar/Sheep $arrow ${Strings.farms}',
        gameData: GameData(
          gameWord: Strings.farms,
          type: GameWordType.Resource,
        ),
      ),
    ],
    Age.Feudal: [
      BuildOrderStep.feudal(
        description: 'Build ${Strings.stable} (Using Gold Vil)',
        gameData: GameData(
          gameWord: Strings.stable,
          type: GameWordType.Building,
        ),
      ),
      BuildOrderStep.feudal(
        description: 'Build ${Strings.blacksmith} (Using Gold Vil)',
        gameData: GameData(
          gameWord: Strings.blacksmith,
          type: GameWordType.Building,
        ),
      ),
      BuildOrderStep.feudal(
        description: '2 on ${Strings.gold}',
        gameData: GameData(
          gameWord: Strings.gold,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 10,
          Resource.Food: 14,
          Resource.Gold: 5,
        },
      ),
      BuildOrderStep.feudal(
        description: 'Research ${Strings.castleAge}',
        startTime: '13:00',
        gameData: GameData(
          gameWord: Strings.castleAge,
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
    ]
  },
);
