import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footybin/modules/team_detail/bloc/team_detail_event.dart';
import 'package:footybin/modules/team_detail/bloc/team_detail_state.dart';
import 'package:footybin/modules/team_detail/repository/team_detail_repo.dart';

class TeamDetailBloc extends Bloc<TeamDetailEvent, TeamDetailState> {
  final TeamDetailRepository repo;

  TeamDetailBloc(this.repo) : super(TeamDetailInitialState()) {
    on<FetchTeamDetailEvent>(_onFetchTeamDetail);
  }

  Future<void> _onFetchTeamDetail(
    FetchTeamDetailEvent event,
    Emitter<TeamDetailState> emit,
  ) async {
    try {
      emit(TeamDetailLoadingState());
      final response = await repo.fetchTeamStats(
        leagueId: event.leagueId,
        season: event.season,
        teamId: event.teamId,
      );
      emit(TeamDetailSuccessState(teamStats: response));
    } catch (e) {
      emit(TeamDetailErrorState(message: e.toString()));
    }
  }
}
