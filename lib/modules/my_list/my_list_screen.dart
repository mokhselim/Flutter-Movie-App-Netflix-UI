import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_old_movies/componantes/componantes/componantes.dart';
import 'package:neo_old_movies/componantes/constants/constants.dart';
import 'package:neo_old_movies/modules/home/home_header.dart';
import 'package:neo_old_movies/modules/movie/movie_screen.dart';
import 'package:neo_old_movies/modules/user/user_navigate.dart';
import 'package:neo_old_movies/shared/cubit/app_cubit/app_cubit.dart';
import 'package:neo_old_movies/shared/cubit/app_cubit/app_states.dart';
import 'package:neo_old_movies/style/colors.dart';
import 'package:neo_old_movies/style/text_styles.dart';

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Container(
          child: cubit.moviesId.length <= 0
              ? Center(
                  child: gotUser != null
                      ? Text(
                          'You Didn\'t Add List Yet',
                          style: arabicStyle.copyWith(
                            fontSize: 26,
                          ),
                          textAlign: TextAlign.center,
                        )
                      : Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'You Didn\'t Login Yet',
                                style: arabicStyle.copyWith(
                                  fontSize: 26,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: userColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    navigateTo(context, UserNavigate());
                                  },
                                  child: Text(
                                    'REGISTER',
                                    style: englishStyle.copyWith(
                                        color: Colors.black),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ))
              : Scaffold(
                  body: CustomScrollView(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: false,
                    slivers: [
                      SliverToBoxAdapter(
                        child: HomeHeader(
                          cubit: cubit,
                          height: 300,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: GridView.count(
                          childAspectRatio: 0.6,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 3,
                          children:
                              List.generate(cubit.myList.length, (index) {
                            var movie = cubit.myList[index];
                            return GestureDetector(
                              onTap: () {
                                cubit.setViews(movie);
                                navigateTo(context, MovieScreen(movie));
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Container(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        height: 160.0,
                                        width: 110.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl: movie.photo,
                                          placeholder: (context, url) => Center(
                                              child:
                                                  CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Container(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        height: 150.0,
                                        width: 110.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: 110.0,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                    ),
                                    child: Text(
                                      movie.movieName,
                                      style: englishStyle,
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                        ),
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }
}
