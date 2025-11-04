import 'package:footybin/modules/home/models/match_stats.dart';
import 'package:footybin/modules/home/models/team.dart';

class TeamStanding {
  final int rank;
  final Team team;
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
      team: Team.fromJson(json['team']),
      points: json['points'],
      stats: MatchStats.fromJson(json['all']),
    );
  }
}
