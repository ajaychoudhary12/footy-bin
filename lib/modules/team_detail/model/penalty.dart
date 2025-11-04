class Penalty {
  final PenaltyStats scored;
  final PenaltyStats missed;
  final int total;

  Penalty({
    required this.scored,
    required this.missed,
    required this.total,
  });

  factory Penalty.fromJson(Map<String, dynamic> json) {
    return Penalty(
      scored: PenaltyStats.fromJson(json['scored']),
      missed: PenaltyStats.fromJson(json['missed']),
      total: json['total'],
    );
  }
}

class PenaltyStats {
  final int total;
  final String percentage;

  PenaltyStats({
    required this.total,
    required this.percentage,
  });

  factory PenaltyStats.fromJson(Map<String, dynamic> json) {
    return PenaltyStats(
      total: json['total'],
      percentage: json['percentage'],
    );
  }
}
