class CleanSheet {
  final int home;
  final int away;
  final int total;

  CleanSheet({
    required this.home,
    required this.away,
    required this.total,
  });

  factory CleanSheet.fromJson(Map<String, dynamic> json) {
    return CleanSheet(
      home: json['home'],
      away: json['away'],
      total: json['total'],
    );
  }
}
