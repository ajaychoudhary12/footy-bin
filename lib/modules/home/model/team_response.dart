class TeamResponse {
  final int id;
  final String name;
  final String logo;

  TeamResponse({required this.id, required this.name, required this.logo});

  factory TeamResponse.fromJson(Map<String, dynamic> json) {
    return TeamResponse(id: json['id'], name: json['name'], logo: json['logo']);
  }
}
