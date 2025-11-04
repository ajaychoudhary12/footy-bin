class Goals {
  final GoalData goalsFor;
  final GoalData goalsAgainst;

  Goals({
    required this.goalsFor,
    required this.goalsAgainst,
  });

  factory Goals.fromJson(Map<String, dynamic> json) {
    return Goals(
      goalsFor: GoalData.fromJson(json['for']),
      goalsAgainst: GoalData.fromJson(json['against']),
    );
  }
}

class GoalData {
  final GoalTotals total;

  GoalData({required this.total});

  factory GoalData.fromJson(Map<String, dynamic> json) {
    return GoalData(
      total: GoalTotals.fromJson(json['total']),
    );
  }
}

class GoalTotals {
  final int home;
  final int away;
  final int total;

  GoalTotals({required this.home, required this.away, required this.total});

  factory GoalTotals.fromJson(Map<String, dynamic> json) {
    return GoalTotals(
      home: json['home'],
      away: json['away'],
      total: json['total'],
    );
  }
}
