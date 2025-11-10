import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footybin/common/tabbar/tab_bar_container.dart';
import 'package:footybin/db/managers/hive_manager.dart';
import 'package:footybin/di/di.dart';
import 'package:footybin/modules/home/bloc/home_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveManager.init();

  runApp(const MyApp());
  DI.registerDependencies();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Footy Bin',
      home: BlocProvider(create: (_) => getIt<HomeBloc>(), child: TabBarContainer()),
    );
  }
}
