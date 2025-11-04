import 'dart:convert';
import 'package:footybin/constants/api_constants.dart';
import 'package:footybin/modules/home/models/league_standings_response.dart';
import 'package:http/http.dart' as http;

abstract class HomeRepository {
  Future<LeagueStandingsResponse> fetchLeagueTable({
    required String leagueId,
    required String season,
  });
}

class HomeRepositoryImpl extends HomeRepository {
  @override
  Future<LeagueStandingsResponse> fetchLeagueTable({
    required String leagueId,
    required String season,
  }) async {
    final url = Uri.parse(
      "${APIConstants.baseUrl}/standings?league=$leagueId&season=$season",
    );

    try {
      final response = await http.get(
        url,
        headers: {"x-apisports-key": APIConstants.apiKey},
      );

      if (response.statusCode == 200) {
        final jsonMap = json.decode(response.body);
        return LeagueStandingsResponse.fromJson(jsonMap);
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception("Failed to fetch league table: $e");
    }
  }
}
