import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'build_orders/build_order_data.dart';
import 'enums/age.dart';
import 'enums/build_type.dart';
import 'enums/difficulty.dart';
import 'enums/resource.dart';
import 'theme_data.dart';
import 'constants.dart';
import 'home_page.dart';
import 'summary_page.dart';

void main() {
  runApp(AoeFlashCardsApp());
}

class AoeFlashCardsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: themeData,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        BuildOrderSummary.routeName: (context) => BuildOrderSummary(),
        DragNDropPage.routeName: (context) => DragNDropPage(),
      },
    );
  }
}

class DragNDropPage extends StatelessWidget {
  static const routeName = '/drag-n-drop-game';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Guess. That. Word!',
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.apply(color: ColorsExt.appBarHoneyYellow),
        ),
      ),
      body: DragNDropGame(),
    );
  }
}

class DragNDropGame extends StatefulWidget {
  var _buildOrder = BuildOrderData(
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
          description: '4 on Wood',
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
          description: '1 lures Boar',
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
          description: 'House + Mill',
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
          description: '2 more on Berries',
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
          description: '1 lures Boar',
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
          description: 'House + 3 on Berries',
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
          description: '1 on Wood',
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
          description: '2nd Lumber Camp',
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
          description: 'House + 4 on Wood',
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
          description: '3 on Gold',
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
          description: '8 from Boar/Sheep → Seed 8 Farms',
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
          description: 'Research Loom',
          gameData: GameData(
            gameWord: Strings.loom,
            type: GameWordType.Tech,
          ),
        ),
        BuildOrderStep.dark(
          description: 'Research Feudal Age',
          startTime: '10:25',
          gameData: GameData(
            gameWord: Strings.feudalAge,
            type: GameWordType.Tech,
          ),
        ),
      ],
    },
  );

  @override
  _DragNDropGameState createState() => _DragNDropGameState(_buildOrder);
}

class _DragNDropGameState extends State<DragNDropGame>
    with SingleTickerProviderStateMixin {
  static final blankWord = '______';

  BuildOrderData buildOrder;

  late BuildOrderStep step;
  late List<String> options;

  Age currentAge = Age.Dark;
  int currentStepIndex = 0;
  bool? guessedRight;
  bool finished = false;
  int wrongGuesses = 0;

  _DragNDropGameState(this.buildOrder) {
    step = buildOrder.steps[currentAge]!.elementAt(currentStepIndex);
    options = guessOptions(step.gameData!.type, step.gameData!.gameWord);
  }

  static List<String> guessOptions(GameWordType type, String include) {
    List<String> options;
    switch (type) {
      case GameWordType.Resource:
        options = [
          Strings.sheep,
          Strings.boar,
          Strings.berries,
          Strings.farms,
          Strings.wood,
          Strings.gold,
          Strings.stone,
        ];
        break;
      case GameWordType.Building:
        options = [
          Strings.mill,
          Strings.lumberCamp,
          Strings.miningCamp,
          Strings.barracks,
          Strings.archeryRange,
        ];
        break;
      case GameWordType.Tech:
        options = [
          Strings.loom,
          Strings.wheelbarrow,
          Strings.doubleBitAxe,
          Strings.feudalAge,
          Strings.castleAge,
        ];
        break;
    }

    options
      ..remove(include) // Remove correct answer from options.
      ..shuffle(); // Randomize wrong answers.

    return options.sublist(0, 3) // Choose just 3 wrong answers.
      ..add(include) // Add correct answer back in.
      ..shuffle(); // Reshuffle so the correct answer isn't always at the end :P
  }

  Widget draggableOption(String word, TextStyle textStyle) {
    if (guessedRight == true && word == step.gameData!.gameWord) {
      // Don't show anything if the card was already used to guess the answer.
      return cardSlot();
    }

    Widget card = cardSlot(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                word,
                style: textStyle.apply(fontSizeFactor: 2),
              ),
            ),
          ),
        ),
      ),
    );

    return Draggable<String>(
      data: word,
      child: card,
      feedback: card,
      childWhenDragging: cardSlot(),
    );
  }

  Widget cardSlot({Widget? child}) {
    return Container(
      width: 250,
      height: 70,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    TextStyle regTextStyle = Theme.of(context).textTheme.bodyText1!;
    TextStyle bigTextStyle = regTextStyle.apply(fontSizeFactor: 2);

    // We've already ensured this step and game data exists
    String gameWord = step.gameData!.gameWord;
    String phrase = step.description.replaceAll(gameWord, blankWord);

    if (finished) {
      Color color = wrongGuesses == 0 ? ColorsExt.polishedPine : ColorsExt.rust;

      return Container(
        color: ColorsExt.backgroundColor,
        alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Completed!',
            style: bigTextStyle,
            textAlign: TextAlign.center,
          ),
          Text(
            '$wrongGuesses wrong guesses',
            style: bigTextStyle.copyWith(color: color),
            textAlign: TextAlign.center,
          ),
          PrimaryButton(
              text: 'Back to Summary', onPressed: () => Navigator.pop(context)),
        ]),
      );
    }

    return Container(
      color: ColorsExt.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: DragTarget<String>(
              builder: (
                BuildContext context,
                List<String?> _,
                List<dynamic> __,
              ) {
                if (guessedRight == true) {
                  bigTextStyle =
                      bigTextStyle.apply(color: ColorsExt.polishedPine);
                } else if (guessedRight == false) {
                  bigTextStyle = bigTextStyle.apply(color: ColorsExt.rust);
                }

                return AnimatedDefaultTextStyle(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: guessedRight == true
                        ? Text(
                            step.description,
                            textAlign: TextAlign.center,
                          )
                        : Text(phrase, textAlign: TextAlign.center),
                  ),
                  style: bigTextStyle,
                  duration: const Duration(milliseconds: 200),
                  onEnd: () => {
                    if (guessedRight == false)
                      setState(() => guessedRight = null)
                  },
                );
              },
              onAccept: (String word) {
                setState(() {
                  guessedRight = word == gameWord;
                  if (guessedRight == false) wrongGuesses++;
                });
              },
              // Only accept if they haven't gotten the right answer yet.
              onWillAccept: (String? word) => guessedRight != true,
            ),
          ),
          Divider(
            color: Colors.grey[300],
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    draggableOption(options.elementAt(0), regTextStyle),
                    draggableOption(options.elementAt(1), regTextStyle),
                    draggableOption(options.elementAt(2), regTextStyle),
                    draggableOption(options.elementAt(3), regTextStyle),
                  ],
                ),
              ],
            ),
          ),
          PrimaryButton(
            text: 'Next Step!',
            onPressed: guessedRight != true
                ? null
                : () => setState(() {
                      if (buildOrder.steps[currentAge]!.length - 1 >
                          currentStepIndex) {
                        // Just go to the next step if it exists.
                        currentStepIndex++;
                      } else if (currentAge.nextAge != null &&
                          buildOrder.steps.containsKey(currentAge.nextAge)) {
                        // Otherwise we start the next age.
                        currentAge = currentAge.nextAge!;
                        currentStepIndex = 0;
                      } else {
                        finished = true;
                      }

                      guessedRight = null;
                      step = buildOrder.steps[currentAge]!
                          .elementAt(currentStepIndex);
                      options = guessOptions(
                          step.gameData!.type, step.gameData!.gameWord);
                    }),
          ),
        ],
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  PrimaryButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        width: 200,
        child: ElevatedButton(
          // Only enable button when this build step is completed.
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return ColorsExt.polishedPine.withOpacity(0.2);
              } else {
                return ColorsExt.polishedPine;
              }
            }),
          ),
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.apply(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
