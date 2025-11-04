import 'package:footybin/modules/home/models/team_standing.dart';

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
    final List<dynamic> list = json['standings'];
    final standings = list.isNotEmpty
        ? (list.first as List<dynamic>)
              .map((item) => TeamStanding.fromJson(item))
              .toList()
        : <TeamStanding>[];

    return League(
      id: json['id'],
      name: json['name'],
      country: json['country'],
      logo: json['logo'],
      season: json['season'],
      standings: standings,
    );
  }
}
