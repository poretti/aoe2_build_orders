import 'package:flutter/material.dart';
import '../theme_data.dart';
import '../constants.dart';
import '../build_orders/build_order_data.dart';
import '../enums/age.dart';
import '../widgets/fitted_text_card.dart';
import '../widgets/bouncy_next_arrow.dart';
import '../widgets/primary_button.dart';

class DragNDropPageArguments {
  final BuildOrderData bo;
  const DragNDropPageArguments({required this.bo});
}

class DragNDropPage extends StatelessWidget {
  static const routeName = '/drag-n-drop-game';

  @override
  Widget build(BuildContext context) {
    final DragNDropPageArguments args =
        ModalRoute.of(context)!.settings.arguments as DragNDropPageArguments;
    final bo = args.bo;

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
      body: DragNDropGame(bo: bo),
    );
  }
}

class DragNDropGame extends StatefulWidget {
  final BuildOrderData bo;

  DragNDropGame({required this.bo});

  @override
  _DragNDropGameState createState() => _DragNDropGameState(bo);
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
    options = guessOptions(step.gameData.type, step.gameData.gameWord);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle bigTextStyle =
        Theme.of(context).textTheme.bodyText1!.apply(fontSizeFactor: 2);

    if (finished) _finishedGame(bigTextStyle);

    return GestureDetector(
      // We make the whole page swipe-able to continue the game.
      onHorizontalDragEnd: guessedRight != true
          ? null
          : (DragEndDetails details) => _incrementGameState(details),
      child: Stack(
        children: [
          Container(
            color: ColorsExt.backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: dragTargetQuestion(bigTextStyle)),
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
                          draggableOption(options.elementAt(0)),
                          draggableOption(options.elementAt(1)),
                          draggableOption(options.elementAt(2)),
                          draggableOption(options.elementAt(3)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Must go last so it's on top of the Stack!
          if (guessedRight == true) BouncyNextArrow(),
        ],
      ),
    );
  }

  Widget dragTargetQuestion(TextStyle textStyle) {
    // We've already ensured this step and game data exists
    String gameWord = step.gameData.gameWord;
    String phrase = step.description.replaceAll(gameWord, blankWord);

    return DragTarget<String>(
      builder: (
        BuildContext context,
        List<String?> _,
        List<dynamic> __,
      ) {
        if (guessedRight == true) {
          textStyle = textStyle.apply(color: ColorsExt.polishedPine);
        } else if (guessedRight == false) {
          textStyle = textStyle.apply(color: ColorsExt.rust);
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
          style: textStyle,
          duration: const Duration(milliseconds: 300),
          curve: guessedRight == null ? Curves.easeIn : Curves.easeOut,
          onEnd: () =>
              {if (guessedRight == false) setState(() => guessedRight = null)},
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
    );
  }

  Widget draggableOption(String word) {
    if (guessedRight == true && word == step.gameData.gameWord) {
      // Don't show anything if the card was already used to guess the answer.
      return cardSlot();
    }

    var card = cardSlot(child: FittedTextCard(word));

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

  Widget _finishedGame(TextStyle textStyle) {
    Color color = wrongGuesses == 0 ? ColorsExt.polishedPine : ColorsExt.rust;

    return Container(
      color: ColorsExt.backgroundColor,
      alignment: Alignment.center,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Completed!',
          style: textStyle,
          textAlign: TextAlign.center,
        ),
        Text(
          '$wrongGuesses wrong guesses',
          style: textStyle.copyWith(color: color),
          textAlign: TextAlign.center,
        ),
        PrimaryButton(
            text: 'Back to Summary', onPressed: () => Navigator.pop(context)),
      ]),
    );
  }

  /// Assumes horizontal drag only
  _incrementGameState(DragEndDetails details) {
    if (details.primaryVelocity! > 0) return;

    setState(() {
      if (buildOrder.steps[currentAge]!.length - 1 > currentStepIndex) {
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
      step = buildOrder.steps[currentAge]!.elementAt(currentStepIndex);
      options = guessOptions(step.gameData.type, step.gameData.gameWord);
    });
  }
}

/// Returns 4 strings of the same GameWordType, one of which is `include`.
/// This determines the 4 guess options on the game screen.
List<String> guessOptions(GameWordType type, String include) {
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
        Strings.market,
        Strings.blacksmith,
        Strings.townCenter,
      ];
      break;
    case GameWordType.Tech:
      options = [
        Strings.loom,
        Strings.wheelbarrow,
        Strings.doubleBitAxe,
        Strings.horseCollar,
        Strings.goldMining,
        Strings.feudalAge,
        Strings.castleAge,
      ];
      break;
    case GameWordType.Unit:
      options = [
        Strings.militia,
        Strings.manAtArms,
        Strings.archers,
        Strings.scouts,
        Strings.crossbowmen,
        Strings.knights,
        Strings.monks,
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
