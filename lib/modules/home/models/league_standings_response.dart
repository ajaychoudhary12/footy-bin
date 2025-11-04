import 'package:footybin/modules/home/models/league.dart';

class LeagueStandingsResponse {
  final League league;

  LeagueStandingsResponse({required this.league});

  factory LeagueStandingsResponse.fromJson(Map<String, dynamic> json) {
    final response = json['response'];
    if (response == null || response is! List || response.isEmpty) {
      throw Exception('Invalid or empty response array');
    }

    final firstItem = response.first;
    if (firstItem == null || firstItem is! Map || firstItem['league'] == null) {
      throw Exception('Missing league data in first response item');
    }

    final leagueJson = firstItem['league'] as Map<String, dynamic>;
    final league = League.fromJson(leagueJson);
    return LeagueStandingsResponse(league: league);
  }
}
