import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footybin/modules/home/bloc/home_event.dart';
import 'package:footybin/modules/home/bloc/home_state.dart';
import 'package:footybin/modules/home/repo/home_repo.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repo;

  HomeBloc(this.repo) : super(HomeInitial()) {
    on<FetchLeagueTableEvent>(_onFetchLeagueTable);
  }

  Future<void> _onFetchLeagueTable(
    FetchLeagueTableEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(HomeLoading());
      final response = await repo.fetchLeagueTable(
        leagueId: event.leagueId,
        season: event.season,
      );
      emit(HomeLoaded(response.league.standings));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
