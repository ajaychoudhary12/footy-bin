class Fixtures {
  final Played played;
  final Wins wins;
  final Draws draws;
  final Loses loses;

  Fixtures({
    required this.played,
    required this.wins,
    required this.draws,
    required this.loses,
  });

  factory Fixtures.fromJson(Map<String, dynamic> json) {
    return Fixtures(
      played: Played.fromJson(json['played']),
      wins: Wins.fromJson(json['wins']),
      draws: Draws.fromJson(json['draws']),
      loses: Loses.fromJson(json['loses']),
    );
  }
}

class Played {
  final int total;
  Played({required this.total});

  factory Played.fromJson(Map<String, dynamic> json) {
    return Played(total: json['total']);
  }
}

class Wins {
  final int total;
  Wins({required this.total});

  factory Wins.fromJson(Map<String, dynamic> json) {
    return Wins(total: json['total']);
  }
}

class Draws {
  final int total;
  Draws({required this.total});

  factory Draws.fromJson(Map<String, dynamic> json) {
    return Draws(total: json['total']);
  }
}

class Loses {
  final int total;
  Loses({required this.total});

  factory Loses.fromJson(Map<String, dynamic> json) {
    return Loses(total: json['total']);
  }
}