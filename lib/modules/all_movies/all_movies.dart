import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neo_old_movies/componantes/componantes/componantes.dart';
import 'package:neo_old_movies/modules/home/home_header.dart';
import 'package:neo_old_movies/modules/movie/movie_screen.dart';

import 'package:neo_old_movies/shared/cubit/app_cubit/app_cubit.dart';
import 'package:neo_old_movies/style/text_styles.dart';

class AllMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return Scaffold(
      body: Column(
        // physics: NeverScrollableScrollPhysics(),
        // shrinkWrap: true,
        children: [
          HomeHeader(
            cubit: cubit,
            height: 220,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.count(
              childAspectRatio: 0.6,
              physics: BouncingScrollPhysics(),
              shrinkWrap: false,
              crossAxisCount: 3,
              children: List.generate(cubit.moviesList.length, (index) {
                var movie = cubit.moviesList[index];
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
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            height: 170.0,
                            width: 110.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: movie.photo,
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            height: 150.0,
                            width: 110.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.movieName,
                              style: englishStyle,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Text(
                              movie.year.toString(),
                              style: englishStyle,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
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
    );
  }
}
