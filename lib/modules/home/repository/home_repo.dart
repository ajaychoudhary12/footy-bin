import 'package:footybin/common/api/network_service.dart';
import 'package:footybin/modules/home/model/league_standings_response.dart';

abstract class HomeRepository {
  Future<LeagueStandingsResponse> fetchLeagueTable({
    required String leagueId,
    required String season,
  });
}

class HomeRepositoryImpl extends HomeRepository {
  final NetworkService _networkService;

  HomeRepositoryImpl(this._networkService);

  @override
  Future<LeagueStandingsResponse> fetchLeagueTable({
    required String leagueId,
    required String season,
  }) async {
    final jsonMap = await _networkService.get(
      "/standings",
      params: {"league": leagueId, "season": season},
    );

    return LeagueStandingsResponse.fromJson(jsonMap);
  }
}
