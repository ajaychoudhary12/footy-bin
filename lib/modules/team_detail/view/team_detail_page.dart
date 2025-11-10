import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footybin/common/constants/string_constants.dart';
import 'package:footybin/common/design_system/colors.dart';
import 'package:footybin/di/di.dart';
import 'package:footybin/modules/favourites/data/team_entity.dart';
import 'package:footybin/modules/favourites/repository/favourites_repository.dart';
import 'package:footybin/modules/team_detail/bloc/team_detail_bloc.dart';
import 'package:footybin/modules/team_detail/bloc/team_detail_event.dart';
import 'package:footybin/modules/team_detail/bloc/team_detail_state.dart';
import 'package:footybin/modules/team_detail/model/team_detail_response.dart';
import 'package:footybin/modules/team_detail/view/form_badge.dart';

class StatItem {
  final String label;
  final String value;

  StatItem(this.label, this.value);
}

class TeamDetailPage extends StatefulWidget {
  final int teamId;
  final String season;
  final String leagueId;

  const TeamDetailPage({
    super.key,
    required this.teamId,
    required this.leagueId,
    required this.season,
  });

  @override
  State<TeamDetailPage> createState() => _TeamDetailPageState();
}

class _TeamDetailPageState extends State<TeamDetailPage> {
  final service = getIt<FavouritesRepository>();

  @override
  void initState() {
    super.initState();
    context.read<TeamDetailBloc>().add(
      FetchTeamDetailEvent(
        leagueId: widget.leagueId,
        season: widget.season,
        teamId: widget.teamId.toString(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(""),
        backgroundColor: AppColors.background,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          BlocBuilder<TeamDetailBloc, TeamDetailState>(
            builder: (context, state) {
              if (state is TeamDetailSuccessState) {
                final teamId = state.teamStats.team.id;
                return IconButton(
                  icon: _getFavIcon(teamId),
                  color: Colors.white,
                  onPressed: () {
                    service.toggleFavourite(
                      TeamEntity(
                        id: state.teamStats.team.id,
                        name: state.teamStats.team.name,
                        logo: state.teamStats.team.logo,
                      ),
                    );
                    setState(() {});
                  },
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
      body: BlocBuilder<TeamDetailBloc, TeamDetailState>(
        builder: (context, state) {
          if (state is TeamDetailLoadingState) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          } else if (state is TeamDetailSuccessState) {
            return _buildUI(state.teamStats);
          } else if (state is TeamDetailErrorState) {
            return Center(
              child: Text(
                'Error: ${state.message}',
                style: const TextStyle(color: Colors.white),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildUI(TeamStatisticsResponse teamStats) {
    final generalStats = [
      StatItem(AppStrings.played, "${teamStats.fixtures.played.total}"),
      StatItem(AppStrings.wins, "${teamStats.fixtures.wins.total}"),
      StatItem(AppStrings.draws, "${teamStats.fixtures.draws.total}"),
      StatItem(AppStrings.loses, "${teamStats.fixtures.loses.total}"),
    ];

    final scoredStats = [
      StatItem(AppStrings.total, "${teamStats.goals.goalsFor.total.total}"),
      StatItem(AppStrings.home, "${teamStats.goals.goalsFor.total.home}"),
      StatItem(AppStrings.away, "${teamStats.goals.goalsFor.total.away}"),
    ];

    final concededStats = [
      StatItem(AppStrings.total, "${teamStats.goals.goalsAgainst.total.total}"),
      StatItem(AppStrings.home, "${teamStats.goals.goalsAgainst.total.home}"),
      StatItem(AppStrings.away, "${teamStats.goals.goalsAgainst.total.away}"),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _teamHeader(teamStats),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: _getFormText(
              teamStats.form,
            ).map((r) => FormBadge(result: r)).toList(),
          ),

          SizedBox(height: 12),
          Expanded(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  _statsCard(
                    title: AppStrings.general,
                    statItemList: generalStats,
                  ),
                  SizedBox(height: 18),
                  _statsCard(
                    title: AppStrings.scored,
                    statItemList: scoredStats,
                  ),
                  SizedBox(height: 18),
                  _statsCard(
                    title: AppStrings.conceded,
                    statItemList: concededStats,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statsCard({
    required String title,
    required List<StatItem> statItemList,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        Card(
          color: AppColors.card,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: statItemList
                  .map(
                    (stat) =>
                        _statRow(statTitle: stat.label, statValue: stat.value),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _teamHeader(TeamStatisticsResponse teamStats) {
    return Row(
      children: [
        SizedBox(
          width: 48,
          height: 48,
          child: Image.network(teamStats.team.logo),
        ),
        SizedBox(width: 12),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              teamStats.team.name,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              teamStats.league.country,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _statRow({required String statTitle, required String statValue}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(statTitle, style: TextStyle(color: AppColors.textPrimary)),
          Text(statValue, style: TextStyle(color: AppColors.textPrimary)),
        ],
      ),
    );
  }

  Widget _getFavIcon(int teamId) {
    if (service.isFavourite(teamId)) {
      return Icon(Icons.bookmark);
    } else {
      return Icon(Icons.bookmark_outline);
    }
  }

  List<String> _getFormText(String form) {
    final lastFive = form.length > 5 ? form.substring(form.length - 5) : form;
    final results = lastFive.split('');
    return results;
  }
}
