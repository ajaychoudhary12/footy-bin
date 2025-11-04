import 'package:footybin/modules/home/models/team_standing.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<TeamStanding> standings;
  HomeLoaded(this.standings);
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
