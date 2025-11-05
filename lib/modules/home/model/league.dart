import 'package:footybin/modules/home/model/team_standing.dart';

class League {
  final int id;
  final String name;
  final String country;
  final String logo;
  final int season;
  final List<TeamStanding> standings;

  League({
    required this.id,
    required this.name,
    required this.country,
    required this.logo,
    required this.season,
    required this.standings,
  });

  factory League.fromJson(Map<String, dynamic> json) {
    final standingsList = json['standings'] as List<dynamic>?;

    final standings = (standingsList != null && standingsList.isNotEmpty)
        ? (standingsList.first as List<dynamic>)
              .map((item) => TeamStanding.fromJson(item))
              .toList()
        : <TeamStanding>[];

    return League(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      country: json['country'] ?? '',
      logo: json['logo'] ?? '',
      season: json['season'] ?? 0,
      standings: standings,
    );
  }
}
