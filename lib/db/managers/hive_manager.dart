import 'package:footybin/db/boxes/favourites_box.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveManager {
  static Future<void> init() async {
    await Hive.initFlutter();
    await FavouritesBox.registerAdapter();
    await FavouritesBox.openBox();
  }
}