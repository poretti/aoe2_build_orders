import 'package:aoe_flash_cards/widgets/summary_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../build_orders/build_order_data.dart';
import '../enums/age.dart';
import '../enums/difficulty.dart';
import '../enums/resource.dart';
import '../theme_data.dart';
import '../image_hero.dart';
import 'drag_n_drop_game.dart';

class BuildOrderSummaryArguments {
  final BuildOrderData bo;
  const BuildOrderSummaryArguments({required this.bo});
}

class BuildOrderSummary extends StatelessWidget {
  static const routeName = '/bo-summary';

  @override
  Widget build(BuildContext context) {
    final BuildOrderSummaryArguments args = ModalRoute.of(context)!
        .settings
        .arguments as BuildOrderSummaryArguments;
    final bo = args.bo;
    final steps = bo.steps;

    return Container(
      color: ColorsExt.backgroundColor,
      child: CustomScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          _buildSliverAppBar(context),
          _buildOverview(context, bo),
          if (steps.containsKey(Age.Dark))
            _buildAgeSteps(context, Age.Dark, steps[Age.Dark]!),
          if (steps.containsKey(Age.Feudal))
            _buildAgeSteps(context, Age.Feudal, steps[Age.Feudal]!),
          if (steps.containsKey(Age.Castle))
            _buildAgeSteps(context, Age.Castle, steps[Age.Castle]!),
          if (steps.containsKey(Age.Imperial))
            _buildAgeSteps(context, Age.Imperial, steps[Age.Imperial]!),
          SliverFillRemaining(
            child: Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(
                      context, DragNDropPage.routeName,
                      arguments: DragNDropPageArguments(bo: bo)),
                  style:
                      ElevatedButton.styleFrom(primary: ColorsExt.polishedPine),
                  child: Text(
                    'Build Order Test',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.apply(color: Colors.white),
                  ),
                ),
              ),
            ),
            hasScrollBody: false,
          )
        ],
      ),
    );
  }

  MultiSliver _buildAgeSteps(
      BuildContext context, Age age, List<BuildOrderStep> steps) {
    List<Resource> resources = _getResources(steps);

    return MultiSliver(
      pushPinnedChildren: true,
      children: [
        SliverPinnedHeader(child: _buildHeader(context, age, resources)),
        SliverClip(
          child: SliverFixedExtentList(
            itemExtent: 50,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) =>
                  _buildListItem(context, index, steps[index], resources),
              childCount: steps.length,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOverview(BuildContext context, BuildOrderData bo) {
    double imageMultiplier = MediaQuery.of(context).size.width < 600
        ? 1
        : MediaQuery.of(context).size.width / 600;

    return SliverToBoxAdapter(
      child: Container(
        decoration: UnderlineTabIndicator(
          borderSide: BorderSide(color: Colors.grey[300]!, width: 0.5),
          insets: EdgeInsets.symmetric(horizontal: 40),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  width: 110 * imageMultiplier,
                  child: BuildOrderHero(
                    photo: bo.image,
                    id: bo.id,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(bo.title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline5),
                      if (bo.author != null)
                        Text('By ${bo.author}',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.apply(fontStyle: FontStyle.italic)),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 60,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Difficulty',
                            style: Theme.of(context).textTheme.bodyText1),
                        Container(height: 30, child: bo.difficulty.widget),
                      ],
                    ),
                  ),
                  Expanded(
                    child: StepCountWithHeader({
                      Age.Dark: bo.steps[Age.Dark]?.length,
                      Age.Feudal: bo.steps[Age.Feudal]?.length
                    }),
                  ),
                ],
              ),
            ),
            Container(
              height: 60,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: TimeToCompleteWithHeader(bo.timeToComplete)),
                  Expanded(child: PopCountWithHeader(bo.ageEndPopCount)),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Text(
                bo.description,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, Age age, List<Resource> resources) {
    Color color;
    switch (age) {
      case Age.Dark:
        color = ColorsExt.honeyYellow[800]!;
        break;
      case Age.Feudal:
        color = ColorsExt.rust[700]!;
        break;
      case Age.Castle:
        color = Colors.indigo[900]!;
        break;
      case Age.Imperial:
        color = Colors.green[900]!;
        break;
    }

    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [color, Colors.grey[200]!],
          center: Alignment(-1, -3),
          radius: 2.1,
        ),
      ),
      child: Row(
        children: [
          Container(
            child: age.shieldIcon,
            width: 60,
            padding: EdgeInsets.symmetric(horizontal: 5),
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.only(left: 25),
                child: Text(age.name,
                    style: Theme.of(context).textTheme.headline6)),
          ),
          ...resources.map((r) => _buildResourceImage(context, r)),
        ],
      ),
    );
  }

  Widget _buildResourceImage(BuildContext context, Resource resource) {
    double margin = MediaQuery.of(context).size.width < 700 ? 5 : 15;

    return Container(
        margin: EdgeInsets.symmetric(horizontal: margin),
        width: 30.0,
        child: resource.image);
  }

  Widget _buildListItem(BuildContext context, int i, BuildOrderStep step,
      List<Resource> resources) {
    double resourceMargin = MediaQuery.of(context).size.width < 700 ? 5 : 15;

    final textTheme = Theme.of(context).textTheme.bodyText1;

    Color color = Colors.white;
    if (i % 2 == 1) {
      color = Colors.grey[100]!;
    }

    var time = step.startTime != null ? ' (${step.startTime})' : '';

    return Container(
      color: color,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(step.description + time, style: textTheme),
            ),
          ),
          ...resources.map(
            (r) => // add container per resource for spacing
                Container(
                    margin: EdgeInsets.symmetric(horizontal: resourceMargin),
                    width: 30.0,
                    alignment: AlignmentDirectional.center,
                    child: Text('${step.vilCount[r] ?? ''}', style: textTheme)),
          ),
        ],
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      pinned: true, // Keep appbar always visible.
      expandedHeight: kToolbarHeight,
      centerTitle: true,
      title: Text(
        'Build Summary',
        style: Theme.of(context)
            .textTheme
            .headline6
            ?.apply(color: ColorsExt.appBarHoneyYellow),
      ),
    );
  }
}

/// Returns the resources correctly ordered. This is what determines the order
/// on the page.
/// EX: Wood, Food, Gold
List<Resource> _getResources(List<BuildOrderStep> steps) {
  var resources = steps.expand((step) => step.vilCount.keys).toSet();

  var ordered = <Resource>[];
  if (resources.contains(Resource.Wood)) ordered.add(Resource.Wood);
  if (resources.contains(Resource.Food)) ordered.add(Resource.Food);
  if (resources.contains(Resource.Gold)) ordered.add(Resource.Gold);
  if (resources.contains(Resource.Stone)) ordered.add(Resource.Stone);
  if (resources.contains(Resource.Builder)) ordered.add(Resource.Builder);
  return ordered;
}
