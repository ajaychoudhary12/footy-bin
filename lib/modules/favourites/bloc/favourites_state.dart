import 'package:footybin/modules/favourites/data/team_entity.dart';

abstract class FavouritesState {}

class FavouritesStateInitial extends FavouritesState {}

class FavouritesLoadingState extends FavouritesState {}

class FavouritesErrorState extends FavouritesState {
  final String error;
  FavouritesErrorState({required this.error});
}

class FavouritesSuccessState extends FavouritesState {
  final List<TeamEntity> favTeams;
  FavouritesSuccessState({required this.favTeams});
}
