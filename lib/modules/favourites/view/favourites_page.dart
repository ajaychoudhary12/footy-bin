import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footybin/common/constants/api_constants.dart';
import 'package:footybin/common/constants/string_constants.dart';
import 'package:footybin/common/design_system/colors.dart';
import 'package:footybin/di/di.dart';
import 'package:footybin/modules/favourites/bloc/favourites_bloc.dart';
import 'package:footybin/modules/favourites/bloc/favourites_state.dart';
import 'package:footybin/modules/favourites/bloc/favourites_event.dart';
import 'package:footybin/modules/favourites/data/team_entity.dart';
import 'package:footybin/modules/team_detail/bloc/team_detail_bloc.dart';
import 'package:footybin/modules/team_detail/view/team_detail_page.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  void initState() {
    super.initState();
    context.read<FavouritesBloc>().add(FetchFavouritesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const Text(
          "Favourites",
          style: TextStyle(color: AppColors.textPrimary),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: false,
      ),
      body: BlocBuilder<FavouritesBloc, FavouritesState>(
        builder: (context, state) {
          if (state is FavouritesLoadingState) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          } else if (state is FavouritesErrorState) {
            return Center(
              child: Text(
                'Error: ${state.error}',
                style: const TextStyle(color: Colors.white),
              ),
            );
          } else if (state is FavouritesSuccessState) {
            final favTeams = state.favTeams;
            if (favTeams.isEmpty) {
              return _buildEmptyView();
            }
            return _buildFavouritesList(favTeams);
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget _buildEmptyView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.sports_soccer, color: Colors.grey, size: 72),
          SizedBox(height: 12),
          Text(
            AppStrings.noFavourites,
            style: TextStyle(color: AppColors.textSecondary, fontSize: 16),
          ),
          SizedBox(height: 4),
          Text(
            AppStrings.addTeamFromHomeScreen,
            style: TextStyle(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildFavouritesList(List<TeamEntity> favTeams) {
    return ListView.separated(
      itemCount: favTeams.length,
      padding: const EdgeInsets.symmetric(vertical: 8),
      separatorBuilder: (_, __) => Divider(
        height: 1,
        indent: 72,
        endIndent: 12,
        color: AppColors.divider,
      ),
      itemBuilder: (context, index) {
        final team = favTeams[index];
        return ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              team.logo,
              height: 48,
              width: 48,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
                  Container(height: 48, width: 48, color: Colors.grey),
            ),
          ),
          title: Text(
            team.name,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider(
                  create: (context) => getIt<TeamDetailBloc>(),
                  child: TeamDetailPage(
                    teamId: team.id,
                    leagueId: APIConstants.leagueId,
                    season: APIConstants.season,
                  ),
                ),
              ),
            );

            if (context.mounted) {
              context.read<FavouritesBloc>().add(FetchFavouritesEvent());
            }
          },
        );
      },
    );
  }
}
