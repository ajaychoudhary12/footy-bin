import 'package:footybin/common/api/network_service.dart';
import 'package:footybin/modules/team_detail/model/team_detail_response.dart';

abstract class TeamDetailRepository {
  Future<TeamStatisticsResponse> fetchTeamStats({
    required String leagueId,
    required String season,
    required String teamId,
  });
}

class TeamDetailRepositoryImpl extends TeamDetailRepository {
  final NetworkService _networkService;
  TeamDetailRepositoryImpl(this._networkService);

  @override
  Future<TeamStatisticsResponse> fetchTeamStats({
    required String leagueId,
    required String season,
    required String teamId,
  }) async {
    final jsonMap = await _networkService.get(
      "/teams/statistics",
      params: {"league": leagueId, "season": season, "team": teamId},
    );

    return TeamStatisticsResponse.fromJson(jsonMap);
  }
}
