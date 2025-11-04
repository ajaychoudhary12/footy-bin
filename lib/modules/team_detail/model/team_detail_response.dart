import 'package:footybin/modules/home/model/league.dart';
import 'package:footybin/modules/home/model/team.dart';
import 'package:footybin/modules/team_detail/model/clean_sheet.dart';
import 'package:footybin/modules/team_detail/model/fixtures.dart';
import 'package:footybin/modules/team_detail/model/goals.dart';
import 'package:footybin/modules/team_detail/model/lineup.dart';
import 'package:footybin/modules/team_detail/model/penalty.dart';

class TeamStatisticsResponse {
  final League league;
  final Team team;
  final String form;
  final Fixtures fixtures;
  final Goals goals;
  final CleanSheet cleanSheet;
  final Penalty penalty;
  final List<Lineup> lineups;

  TeamStatisticsResponse({
    required this.league,
    required this.team,
    required this.form,
    required this.fixtures,
    required this.goals,
    required this.cleanSheet,
    required this.penalty,
    required this.lineups,
  });

  factory TeamStatisticsResponse.fromJson(Map<String, dynamic> json) {
    final response = json['response'];
    return TeamStatisticsResponse(
      league: League.fromJson(response['league']),
      team: Team.fromJson(response['team']),
      form: response['form'] ?? '',
      fixtures: Fixtures.fromJson(response['fixtures']),
      goals: Goals.fromJson(response['goals']),
      cleanSheet: CleanSheet.fromJson(response['clean_sheet']),
      penalty: Penalty.fromJson(response['penalty']),
      lineups: (response['lineups'] as List<dynamic>)
          .map((e) => Lineup.fromJson(e))
          .toList(),
    );
  }
}
