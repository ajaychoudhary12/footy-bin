import 'package:footybin/modules/home/model/match_stats.dart';
import 'package:footybin/modules/home/model/team_response.dart';

class TeamStanding {
  final int rank;
  final TeamResponse team;
  final int points;
  final MatchStats stats;

  TeamStanding({
    required this.rank,
    required this.team,
    required this.points,
    required this.stats,
  });

  factory TeamStanding.fromJson(Map<String, dynamic> json) {
    return TeamStanding(
      rank: json['rank'],
      team: TeamResponse.fromJson(json['team']),
      points: json['points'],
      stats: MatchStats.fromJson(json['all']),
    );
  }
}
