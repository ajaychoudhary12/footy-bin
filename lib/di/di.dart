import 'package:footybin/common/api/network_service.dart';
import 'package:footybin/modules/favourites/bloc/favourites_bloc.dart';
import 'package:footybin/modules/favourites/repository/favourites_repository.dart';
import 'package:footybin/modules/home/bloc/home_bloc.dart';
import 'package:footybin/modules/home/repository/home_repo.dart';
import 'package:footybin/modules/team_detail/bloc/team_detail_bloc.dart';
import 'package:footybin/modules/team_detail/repository/team_detail_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class DI {
  static void registerDependencies() {
    getIt.registerSingleton<NetworkService>(NetworkServiceImpl());

    getIt.registerFactory<HomeRepository>(
      () => HomeRepositoryImpl(getIt<NetworkService>()),
    );

    getIt.registerFactory<TeamDetailRepository>(
      () => TeamDetailRepositoryImpl(getIt<NetworkService>()),
    );

    getIt.registerFactory<HomeBloc>(() => HomeBloc(getIt<HomeRepository>()));

    getIt.registerFactory<TeamDetailBloc>(
      () => TeamDetailBloc(getIt<TeamDetailRepository>()),
    );

    getIt.registerLazySingleton<FavouritesRepository>(
      () => FavouritesRepositoryImpl(),
    );

    getIt.registerFactory<FavouritesBloc>(
      () => FavouritesBloc(getIt<FavouritesRepository>()),
    );
  }
}
