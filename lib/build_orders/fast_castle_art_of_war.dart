import 'package:aoe_flash_cards/build_orders/build_order_data.dart';
import 'package:aoe_flash_cards/enums/age.dart';
import 'package:aoe_flash_cards/enums/build_type.dart';
import 'package:aoe_flash_cards/enums/difficulty.dart';
import 'package:aoe_flash_cards/enums/resource.dart';
import 'package:aoe_flash_cards/constants.dart';

var fastCastleByArtOfWar = BuildOrderData(
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
        description: '1 lures ${Strings.boar}',
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
        description: '1 lures ${Strings.boar}',
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
        description: 'House + 3 on ${Strings.berries}',
        gameData: GameData(
          gameWord: Strings.berries,
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
        description: '2nd ${Strings.lumberCamp}',
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
        description: 'House + 4 on ${Strings.wood}',
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
        description: '8 from Boar/Sheep → Seed 8 ${Strings.farms}',
        gameData: GameData(
          gameWord: Strings.farms,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 10,
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
        startTime: '10:25',
        gameData: GameData(
          gameWord: Strings.feudalAge,
          type: GameWordType.Tech,
        ),
      ),
    ],
    Age.Feudal: [
      BuildOrderStep.feudal(
        description: 'Build ${Strings.market} (using 2 from Gold)',
        gameData: GameData(
          gameWord: Strings.market,
          type: GameWordType.Building,
        ),
        vilCount: {
          Resource.Wood: 10,
          Resource.Food: 14,
          Resource.Gold: 1,
          Resource.Builder: 2,
        },
      ),
      BuildOrderStep.feudal(
        description: 'Build ${Strings.blacksmith} (using 1 from Gold)',
        gameData: GameData(
          gameWord: Strings.blacksmith,
          type: GameWordType.Building,
        ),
        vilCount: {
          Resource.Wood: 10,
          Resource.Food: 14,
          Resource.Gold: 0,
          Resource.Builder: 3,
        },
      ),
      BuildOrderStep.feudal(
        description: 'Queue 2 on ${Strings.wood}',
        gameData: GameData(
          gameWord: Strings.wood,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 12,
          Resource.Food: 14,
          Resource.Gold: 3,
        },
      ),
      BuildOrderStep.feudal(
        description: 'Research ${Strings.castleAge}',
        gameData: GameData(
          gameWord: Strings.castleAge,
          type: GameWordType.Tech,
        ),
        startTime: '13:25',
      ),
      BuildOrderStep.feudal(
        description: '6 from Berries → 6 ${Strings.farms}',
        gameData: GameData(
          gameWord: Strings.farms,
          type: GameWordType.Resource,
        ),
        vilCount: {
          Resource.Wood: 12,
          Resource.Food: 14,
          Resource.Gold: 3,
        },
      ),
    ]
  },
);
