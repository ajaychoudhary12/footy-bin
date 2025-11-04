import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footybin/modules/home/bloc/home_event.dart';
import 'package:footybin/modules/home/bloc/home_state.dart';
import 'package:footybin/modules/home/repository/home_repo.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repo;

  HomeBloc(this.repo) : super(HomeInitialState()) {
    on<FetchLeagueTableEvent>(_onFetchLeagueTable);
  }

  Future<void> _onFetchLeagueTable(
    FetchLeagueTableEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(HomeLoadingState());
      final response = await repo.fetchLeagueTable(
        leagueId: event.leagueId,
        season: event.season,
      );
      emit(HomeSuccessState(response.league.standings));
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }
}
