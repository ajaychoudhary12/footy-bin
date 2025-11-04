class MatchStats {
  final int played;
  final int win;
  final int draw;
  final int lose;

  MatchStats({
    required this.played,
    required this.win,
    required this.draw,
    required this.lose,
  });

  factory MatchStats.fromJson(Map<String, dynamic> json) {
    return MatchStats(
      played: json['played'],
      win: json['win'],
      draw: json['draw'],
      lose: json['lose'],
    );
  }
}
