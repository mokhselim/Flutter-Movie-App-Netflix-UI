import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_old_movies/modules/all_movies/all_movies.dart';
import 'package:neo_old_movies/modules/home/home_screen.dart';
import 'package:neo_old_movies/modules/my_list/my_list_screen.dart';
import 'package:neo_old_movies/modules/new/new_screen.dart';
import 'package:neo_old_movies/shared/cubit/app_cubit/app_cubit.dart';
import 'package:neo_old_movies/shared/cubit/app_cubit/app_states.dart';
import 'bottom_navigation_bar.dart';

class LayoutScreen extends StatelessWidget {
  final List<Widget> _screens = [
    HomeScreen(),
    NewScreen(),
    AllMovies(),
    MyList(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit()..getMovies(),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (BuildContext context, state) {
            if (state is AppGetUserListSuccessState) {
              var cubit = AppCubit.get(context);
              cubit.getMyList();
            }
          },
          builder: (BuildContext context, Object? state) {
            var cubit = AppCubit.get(context);

            return Scaffold(
              extendBodyBehindAppBar: true,
              bottomNavigationBar: defaultNavBar(cubit),
              body: _screens[cubit.navBar],
            );
          },
        ));
  }
}
