import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footybin/common/design_system/colors.dart';
import 'package:footybin/di/di.dart';
import 'package:footybin/modules/favourites/bloc/favourites_bloc.dart';
import 'package:footybin/modules/favourites/view/favourites_page.dart';
import 'package:footybin/modules/home/bloc/home_bloc.dart';
import 'package:footybin/modules/home/view/home_page.dart';

class TabBarContainer extends StatefulWidget {
  const TabBarContainer({super.key});

  @override
  State<TabBarContainer> createState() => _TabBarContainerState();
}

class _TabBarContainerState extends State<TabBarContainer> {
  var _selectedIndex = 0;

  final pages = [
      BlocProvider<HomeBloc>(
        create: (_) => getIt<HomeBloc>(),
        child: const HomePage(),
      ),
      BlocProvider<FavouritesBloc>(
        create: (_) => getIt<FavouritesBloc>(),
        child: const FavouritesPage(),
      ),
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.appBar,
        selectedItemColor: AppColors.textPrimary,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Fav"),
        ],
        onTap: _itemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }

  void _itemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
