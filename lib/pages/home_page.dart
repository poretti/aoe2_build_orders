import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../build_orders/build_order_data.dart';
import '../build_orders/build_orders.dart';
import '../enums/build_type.dart';
import '../enums/difficulty.dart';
import '../widgets/game_content_usage_blurb.dart';
import '../widgets/summary_widgets.dart';
import '../constants.dart';
import '../image_hero.dart';
import 'summary_page.dart';
import '../theme_data.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  final buildOrders = BuildOrders();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsExt.backgroundColor,
      child: CustomScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          _buildSliverAppBar(context),
          ..._buildGroups(),
          SliverFillRemaining(
            child: GameContentUsageRules(appName),
            hasScrollBody: false,
          )
        ],
      ),
    );
  }

  List<MultiSliver> _buildGroups() {
    return buildOrders.buildOrders.entries
        .map((e) => _buildGroup(e.key, e.value))
        .toList();
  }

  MultiSliver _buildGroup(
      BuildType buildType, List<BuildOrderData> buildOrders) {
    return MultiSliver(
      pushPinnedChildren: true,
      children: <Widget>[
        SliverPinnedHeader(child: ListHeader(buildType.displayName)),
        SliverClip(
          child: SliverFixedExtentList(
              delegate: SliverChildListDelegate.fixed(
                  buildOrders.map((bo) => BuildOrderCard(bo)).toList()),
              itemExtent: 80),
        ),
      ],
    );
  }

  SliverAppBar _buildSliverAppBar(BuildContext context) {
    double height = MediaQuery.of(context).size.width < 700 ? 180 : 280;

    return SliverAppBar(
      pinned: true, // Keep appbar always visible.
      snap: false,
      floating: false, // Don't expose appbar when scrolling up.
      stretch: true,
      primary: true,
      expandedHeight: height,
      backgroundColor: Colors.grey[850],
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
        title: Stack(children: [
          Text('BUILD ORDERS',
              style: superDuperSpecialFont.copyWith(
                  letterSpacing: 1.25,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 0.1
                    ..color = (Colors.white))),
          Text(
            'BUILD ORDERS',
            style: superDuperSpecialFont.copyWith(
              color: ColorsExt.appBarHoneyYellow,
              letterSpacing: 1.25,
            ),
          )
        ]),
        background: Image.asset(
          'assets/aoe_header.jpg',
          fit: BoxFit.cover,
        ),
        centerTitle: true,
      ),
    );
  }
}

class ListHeader extends StatelessWidget {
  final String title;

  ListHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: UnderlineTabIndicator(
        // TODO: configure via ThemeData
        borderSide: BorderSide(color: Colors.grey[300]!, width: 1.0),
        insets: EdgeInsets.symmetric(horizontal: 12),
      ),
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}

class BuildOrderCard extends StatelessWidget {
  final BuildOrderData bo;

  BuildOrderCard(this.bo);

  @override
  Widget build(BuildContext context) {
    final wideScreen = MediaQuery.of(context).size.width > 700;

    double cardMarginMultiplier = wideScreen ? 2 : 1;
    double margin = wideScreen ? 20 : 0;

    return Card(
      margin: EdgeInsets.only(
          top: 0,
          left: 8 * cardMarginMultiplier,
          right: 8 * cardMarginMultiplier,
          bottom: 5 * cardMarginMultiplier),
      elevation: 0,
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          BuildOrderSummary.routeName,
          arguments: BuildOrderSummaryArguments(bo: bo),
        ),
        customBorder: Theme.of(context).cardTheme.shape,
        splashColor: ColorsExt.appBarHoneyYellow,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 60,
              margin: EdgeInsets.symmetric(horizontal: margin),
              padding: EdgeInsets.only(left: 8),
              child: BuildOrderHero(
                photo: bo.image,
                id: bo.id,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(bo.title,
                        style: Theme.of(context).textTheme.bodyText1),
                    if (bo.author != null)
                      Text('By ${bo.author}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.apply(fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: margin),
              alignment: AlignmentDirectional.center,
              child: BuildOrderTime(bo.timeToComplete, bo.ageEndPopCount),
            ),
            Container(
                width: 60,
                margin: EdgeInsets.symmetric(horizontal: margin),
                padding: EdgeInsets.only(right: 8),
                child: bo.difficulty.widget),
          ],
        ),
      ),
    );
  }
}
