import 'package:collection/collection.dart';
import 'package:aoe_flash_cards/build_orders/build_order_data.dart';
import 'package:aoe_flash_cards/enums/build_type.dart';
import 'fast_castle_art_of_war.dart';
import 'p22_maa_archers_cicero.dart';
import 'scouts_knights_hera.dart';
import 'archers_ageofnotes.dart';
import 'knights_aoecompanion.dart';

class BuildOrders {
  // This list currently decides the order on the home page.
  final _buildOrders = [
    archersAgeOfNotes,
    scoutsIntoKnights,
    p22MaaArchersCicero,
    fastCastleByArtOfWar,
    knightsAoeCompanion,
  ];

  static final BuildOrders _singleton = BuildOrders._internal();
  factory BuildOrders() {
    return _singleton;
  }
  BuildOrders._internal();

  Map<BuildType, List<BuildOrderData>> get buildOrders {
    return groupBy(_buildOrders, (bo) => bo.mainType);
  }
}
