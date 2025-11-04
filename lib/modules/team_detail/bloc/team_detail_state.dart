import 'package:footybin/modules/team_detail/model/team_detail_response.dart';

abstract class TeamDetailState {}

class TeamDetailLoadingState extends TeamDetailState {}

class TeamDetailInitialState extends TeamDetailState {}

class TeamDetailErrorState extends TeamDetailState {
  String message;
  TeamDetailErrorState({required this.message});
}

class TeamDetailSuccessState extends TeamDetailState {
  final TeamStatisticsResponse teamStats;
  TeamDetailSuccessState({required this.teamStats});
}
