import 'package:aoe_flash_cards/build_orders/build_order_data.dart';
import 'package:aoe_flash_cards/enums/age.dart';
import 'package:aoe_flash_cards/enums/build_type.dart';
import 'package:aoe_flash_cards/enums/difficulty.dart';
import 'package:aoe_flash_cards/enums/resource.dart';
import 'package:aoe_flash_cards/constants.dart';

// https://ageofnotes.com/strategies/23-pop-archers-build-order-step-by-step-to-destroy-ranked-queue/

var archersAgeOfNotes = BuildOrderData(
  id: 'archersAgeOfNotes',
  title: 'Archers ',
  author: 'Age of Notes',
  image: 'assets/units/archer.png',
  description:
  'The 23 pop Archer rush is a great build order for beginners. Once archers '
      'are massed, they are very hard to stop.\n\n'
      'You can delay getting Loom until later if you are comfortable with Boar lures. '
      'You can also choose to do more Feudal aggression instead of going to Castle '
      'depending on how the game is going.',
  timeToComplete: '20:40',
  mainType: BuildType.FastFeudal,
  difficulty: Difficulty.Easy,
  ageEndPopCount: {
    // Includes Scout
    Age.Dark: 23, // 22 vils
    Age.Feudal: 36, // 35 vils
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
        description: 'Research ${Strings.loom}',
        gameData: GameData(
          gameWord: Strings.loom,
          type: GameWordType.Tech,
        ),
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
        description: '3 more on ${Strings.boar}/${Strings.sheep}',
        gameData: GameData(
          gameWord: Strings.sheep,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 4,
          Resource.Food: 15,
        },
      ),
      BuildOrderStep.dark(
        description: '2nd ${Strings.lumberCamp}',
        gameData: GameData(
          gameWord: Strings.lumberCamp,
          type: GameWordType.Building,
        ),
        vilCount: {
          Resource.Wood: 5,
          Resource.Food: 15,
        },
      ),
      BuildOrderStep.dark(
        description: '2 more on ${Strings.wood}',
        gameData: GameData(
          gameWord: Strings.wood,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 7,
          Resource.Food: 15,
        },
      ),
      BuildOrderStep.dark(
        description: 'Research ${Strings.feudalAge}',
        startTime: '8:20',
        gameData: GameData(
          gameWord: Strings.feudalAge,
          type: GameWordType.Tech,
        ),
      ),
      BuildOrderStep.dark(
        description: '3 from Boar/Sheep $arrow ${Strings.miningCamp}',
        gameData: GameData(
          gameWord: Strings.miningCamp,
          type: GameWordType.Building,
        ),
        vilCount: {
          Resource.Wood: 7,
          Resource.Food: 12,
          Resource.Gold: 3,
        },
      ),
      BuildOrderStep.dark(
        description: '5 from Boar/Sheep $arrow ${Strings.wood}',
        gameData: GameData(
          gameWord: Strings.wood,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 12,
          Resource.Food: 7,
          Resource.Gold: 3,
        },
      ),
      BuildOrderStep.dark(
        description: 'Build ${Strings.barracks} + 2 Houses',
        gameData: GameData(
          gameWord: Strings.barracks,
          type: GameWordType.Building,
        ),
        vilCount: {
          Resource.Wood: 10,
          Resource.Food: 7,
          Resource.Gold: 3,
          Resource.Builder: 2,
        },
      ),
    ],
    Age.Feudal: [
      BuildOrderStep.feudal(
        description: 'Research ${Strings.doubleBitAxe}',
        gameData: GameData(
          gameWord: Strings.doubleBitAxe,
          type: GameWordType.Tech,
        ),
      ),
      BuildOrderStep.feudal(
        description: 'Build 2 of: ${Strings.archeryRange}, House',
        gameData: GameData(
          gameWord: Strings.archeryRange,
          type: GameWordType.Building,
        ),
        vilCount: {
          Resource.Wood: 10,
          Resource.Food: 7,
          Resource.Gold: 3,
          Resource.Builder: 2,
        },
      ),
      BuildOrderStep.feudal(
        description: '4 on ${Strings.gold}',
        gameData: GameData(
          gameWord: Strings.gold,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 10,
          Resource.Food: 7,
          Resource.Gold: 7,
          Resource.Builder: 2,
        },
      ),
      BuildOrderStep.feudal(
        description: '1 Builder $arrow ${Strings.wood}',
        gameData: GameData(
          gameWord: Strings.wood,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 11,
          Resource.Food: 7,
          Resource.Gold: 7,
          Resource.Builder: 1,
        },
      ),
      BuildOrderStep.feudal(
        description: '1 Builder $arrow 2 Houses + ${Strings.farms}',
        gameData: GameData(
          gameWord: Strings.farms,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 11,
          Resource.Food: 8,
          Resource.Gold: 7,
        },
      ),
      BuildOrderStep.feudal(
        description: '10 on ${Strings.farms} (as Wood becomes available)',
        gameData: GameData(
          gameWord: Strings.farms,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 11,
          Resource.Food: 16,
          Resource.Gold: 7,
        },
      ),
      BuildOrderStep.feudal(
        description: 'Build House + ${Strings.blacksmith}',
        gameData: GameData(
          gameWord: Strings.blacksmith,
          type: GameWordType.Building,
        ),
      ),
      BuildOrderStep.feudal(
        description: 'Research ${Strings.fletching}',
        gameData: GameData(
          gameWord: Strings.fletching,
          type: GameWordType.Tech,
        ),
      ),
      BuildOrderStep.feudal(
        description: 'Research ${Strings.wheelbarrow}',
        gameData: GameData(
          gameWord: Strings.wheelbarrow,
          type: GameWordType.Tech,
        ),
      ),
      BuildOrderStep.feudal(
        description: 'House + 3 on ${Strings.gold}',
        gameData: GameData(
          gameWord: Strings.gold,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 11,
          Resource.Food: 16,
          Resource.Gold: 10,
        },
      ),
      BuildOrderStep.feudal(
        description: 'Research ${Strings.castleAge}',
        startTime: '18:00',
        gameData: GameData(
          gameWord: Strings.castleAge,
          type: GameWordType.Tech,
        ),
      ),
    ],
  },
);
