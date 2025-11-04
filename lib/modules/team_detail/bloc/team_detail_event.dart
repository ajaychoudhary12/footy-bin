abstract class TeamDetailEvent {}

class FetchTeamDetailEvent extends TeamDetailEvent {
  String leagueId;
  String season;
  String teamId;

  FetchTeamDetailEvent({
    required this.leagueId,
    required this.season,
    required this.teamId,
  });
}
