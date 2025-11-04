import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footybin/common/design_system/colors.dart';
import 'package:footybin/modules/team_detail/bloc/team_detail_bloc.dart';
import 'package:footybin/modules/team_detail/bloc/team_detail_event.dart';
import 'package:footybin/modules/team_detail/bloc/team_detail_state.dart';
import 'package:footybin/modules/team_detail/model/team_detail_response.dart';

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
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_outline),
            color: Colors.white,
            onPressed: () {},
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
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }
        },
      ),
    );
    // return const SingleChildScrollView(
    //   child: Column(
    //     children: [

    //     ],
    //   ),
    // );
  }

  Widget _buildUI(TeamStatisticsResponse teamStats) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Row(
        children: [
          if (teamStats.team?.logo != null)
            SizedBox(
              width: 48,
              height: 48,
              child: Image.network(teamStats.team!.logo),
            ),
          SizedBox(width: 12),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                teamStats.team!.name,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (teamStats.league?.country != null)
              Text(
                teamStats.league!.country!,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
