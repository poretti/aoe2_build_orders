import 'package:collection/collection.dart';
import 'package:aoe_flash_cards/build_orders/build_order_data.dart';
import 'package:aoe_flash_cards/enums/build_type.dart';
import 'fast_castle_art_of_war.dart';
import 'p22_maa_archers_cicero.dart';

class BuildOrders {
  final _buildOrders = [
    fastCastleByArtOfWar,
    p22MaaArchersCicero,
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
