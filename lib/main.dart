import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footybin/common/api/network_service.dart';
import 'package:footybin/modules/home/bloc/home_bloc.dart';
import 'package:footybin/modules/home/repository/home_repo.dart';
import 'package:footybin/modules/home/view/home_page.dart';
import 'package:footybin/modules/team_detail/bloc/team_detail_bloc.dart';
import 'package:footybin/modules/team_detail/repository/team_detail_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void main() {
  runApp(const MyApp());
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
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Footy Bin',
      home: BlocProvider(create: (_) => getIt<HomeBloc>(), child: HomePage()),
    );
  }
}
