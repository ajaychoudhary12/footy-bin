import 'package:footybin/db/boxes/favourites_box.dart';
import 'package:footybin/modules/favourites/data/team_entity.dart';

abstract class FavouritesRepository {
  List<TeamEntity> getFavourites();
  bool isFavourite(int id);
  Future<void> toggleFavourite(TeamEntity teamEntity);
}

class FavouritesRepositoryImpl extends FavouritesRepository {
  final _box = FavouritesBox.box;

  @override
  List<TeamEntity> getFavourites() {
    return _box.values.toList();
  }

  @override
  bool isFavourite(int id) {
    return _box.containsKey(id);
  }

  @override
  Future<void> toggleFavourite(TeamEntity teamEntity) async {
    if (isFavourite(teamEntity.id)) {
      await _box.delete(teamEntity.id);
    } else {
      await _box.put(teamEntity.id, teamEntity);
    }
  }
}