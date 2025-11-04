abstract class HomeEvent {}

class FetchLeagueTableEvent extends HomeEvent {
  String leagueId;
  String season;

  FetchLeagueTableEvent({required this.leagueId, required this.season});
}
