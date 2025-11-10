import 'package:footybin/modules/favourites/data/team_entity.dart';
import 'package:hive/hive.dart';

class FavouritesBox {
  static const boxName = "favourites";
  static late Box<TeamEntity> _box;

  static Future<void> registerAdapter() async {
    Hive.registerAdapter(TeamEntityAdapter());
  }

  static Future<void> openBox() async {
    _box = await Hive.openBox(boxName);
  }

  static Box<TeamEntity> get box => _box;
}