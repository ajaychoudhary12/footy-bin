import 'package:footybin/modules/home/model/team_standing.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<TeamStanding> standings;
  HomeSuccessState(this.standings);
}

class HomeErrorState extends HomeState {
  final String message;
  HomeErrorState(this.message);
}
