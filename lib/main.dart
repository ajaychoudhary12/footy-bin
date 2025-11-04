import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footybin/modules/home/bloc/home_bloc.dart';
import 'package:footybin/modules/home/repo/home_repo.dart';
import 'package:footybin/modules/home/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Footy Bin',
      home: BlocProvider(
        create: (context) {
          return HomeBloc(HomeRepositoryImpl());
        },
        child: const HomePage(),
      ),
    );
  }
}
