import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footybin/constants/string_constants.dart';
import 'package:footybin/design_system/colors.dart';
import 'package:footybin/modules/home/bloc/home_bloc.dart';
import 'package:footybin/modules/home/bloc/home_event.dart';
import 'package:footybin/modules/home/bloc/home_state.dart';
import 'package:footybin/modules/home/models/team_standing.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeBloc>().add(
        FetchLeagueTableEvent(leagueId: "39", season: "2023"),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.leagueTable,
          style: TextStyle(color: AppColors.textPrimary),
        ),
        backgroundColor: AppColors.appBar,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeLoaded) {
            return _buildStandingsList(state.standings);
          } else if (state is HomeError) {
            return Center(
              child: Text(
                'Error: ${state.message}',
                style: const TextStyle(color: Colors.redAccent),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildStandingsList(List<TeamStanding> standings) {
    return Container(
      color: AppColors.background,
      child: ListView.separated(
        itemCount: standings.length + 1,
        separatorBuilder: (context, index) {
          if (index == 0) return const SizedBox.shrink();
          return Divider(
            height: 1,
            thickness: 0.6,
            indent: 12,
            endIndent: 12,
            color: AppColors.divider,
          );
        },
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              child: Row(
                children: [
                  Text(
                    AppStrings.club,
                    style: const TextStyle(color: AppColors.textPrimary),
                  ),
                  const Spacer(),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getText(AppStrings.playedAbbv),
                        getText(AppStrings.winAbbv),
                        getText(AppStrings.drawAbbv),
                        getText(AppStrings.loseAbbv),
                        getText(AppStrings.pointsAbbv),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }

          final teamStanding = standings[index - 1];

          return Container(
            height: 36,
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                  child: Text(
                    '${teamStanding.rank}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: AppColors.textPrimary),
                  ),
                ),
                const SizedBox(width: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    teamStanding.team.logo,
                    height: 28,
                    width: 28,
                    errorBuilder: (context, error, stack) =>
                        Container(height: 28, width: 28, color: Colors.grey),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    teamStanding.team.name,
                    style: const TextStyle(color: AppColors.textPrimary),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      getText("${teamStanding.stats.played}"),
                      getText("${teamStanding.stats.win}"),
                      getText("${teamStanding.stats.draw}"),
                      getText("${teamStanding.stats.lose}"),
                      getText("${teamStanding.points}"),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget getText(String value) {
    return SizedBox(
      width: 26,
      child: Text(
        value,
        textAlign: TextAlign.center,
        style: const TextStyle(color: AppColors.textPrimary),
      ),
    );
  }
}
