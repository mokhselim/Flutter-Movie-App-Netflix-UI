import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_old_movies/shared/cubit/app_cubit/app_cubit.dart';
import 'package:neo_old_movies/shared/cubit/app_cubit/app_states.dart';
import 'package:neo_old_movies/style/text_styles.dart';
import 'home_header.dart';
import 'home_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return CustomScrollView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: false,
          slivers: [
            SliverToBoxAdapter(
              child: HomeHeader(
                cubit: cubit,
              ),
            ),
            SliverToBoxAdapter(
              child: cubit.moviesList.length == 0
                  ? Container(
                      padding: EdgeInsets.only(top: 40),
                      alignment: Alignment.center,
                      height: 200,
                      child: Column(
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Check Your Connection',
                            style: englishStyle,
                          ),
                        ],
                      ),
                    )
                  : ContentList(
                      moviesList: cubit.moviesList,
                      title: 'Last Added',
                      isOriginals: false,
                    ),
            ),
            SliverToBoxAdapter(
              child: cubit.moviesList.length == 0
                  ? null
                  : ContentList(
                      moviesList: cubit.trendingList,
                      title: 'Trending',
                      isOriginals: true,
                    ),
            ),
            SliverToBoxAdapter(
              child: cubit.moviesList.length == 0
                  ? null
                  : ContentList(
                      moviesList: cubit.mostViewedList,
                      title: 'Most Viewed',
                      isOriginals: false,
                    ),
            ),
          ],
        );
      },
    );
  }
}
