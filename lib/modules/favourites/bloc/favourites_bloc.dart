import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footybin/modules/favourites/bloc/favourites_event.dart';
import 'package:footybin/modules/favourites/bloc/favourites_state.dart';
import 'package:footybin/modules/favourites/repository/favourites_repository.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  final FavouritesRepository _repo;

  FavouritesBloc(this._repo) : super(FavouritesStateInitial()) {
    on<FetchFavouritesEvent>(_onFetchLeagueTable);
  }

  Future<void> _onFetchLeagueTable(
    FetchFavouritesEvent event,
    Emitter<FavouritesState> emit,
  ) async {
    try {
      emit(FavouritesLoadingState());
      final favTeams = _repo.getFavourites();
      emit(FavouritesSuccessState(favTeams: favTeams));
    } catch (e) {
      emit(FavouritesErrorState(error: e.toString()));
    }
  }
}
