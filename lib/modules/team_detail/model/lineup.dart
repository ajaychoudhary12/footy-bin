class Lineup {
  final String formation;
  final int played;

  Lineup({
    required this.formation,
    required this.played,
  });

  factory Lineup.fromJson(Map<String, dynamic> json) {
    return Lineup(
      formation: json['formation'],
      played: json['played'],
    );
  }
}
