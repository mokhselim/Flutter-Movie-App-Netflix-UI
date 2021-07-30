import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:neo_old_movies/componantes/componantes/componantes.dart';
import 'package:neo_old_movies/models/movie_model/movie_model.dart';
import 'package:neo_old_movies/modules/movie/movie_screen.dart';
import 'package:neo_old_movies/shared/cubit/app_cubit/app_cubit.dart';
import 'package:neo_old_movies/style/text_styles.dart';


class ContentList extends StatelessWidget {
  final String title;
  final List<MovieModel> moviesList;
  final bool isOriginals;

  const ContentList({
    required this.title,
    required this.moviesList,

    this.isOriginals = false,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              title,
              style: arabicStyle.copyWith(fontSize: 20),
            ),
          ),
          Container(
            height: isOriginals ? 280.0 : 200.0,
            child: ListView.builder(
              primary: true,
              shrinkWrap: false,
              physics: BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                vertical: 2.0,
                horizontal: 8.0,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: moviesList.length,
              itemBuilder: (BuildContext context, int index) {
                // if(isOriginals){
                //   moviesList.shuffle();
                // }
                var movie = moviesList[index];
                return GestureDetector(
                  onTap: () {
                    cubit.setTrending(movie);
                    navigateTo(context, MovieScreen(movie));

                    // navigateTo(
                    //     context, VideoPlayer(moviesList[index].youtubeLink));
                  },
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            height: isOriginals ? 250.0 : 160.0,
                            width: isOriginals ? 140.0 : 110.0,
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
                            height: isOriginals ? 250.0 : 150.0,
                            width: isOriginals ? 140.0 : 110.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              gradient: isOriginals
                                  ? LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.center,
                                      colors: [
                                          Colors.black38,
                                          Colors.transparent
                                        ])
                                  : null,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: isOriginals ? 140.0 : 110.0,
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
              },
            ),
          ),
        ],
      ),
    );
  }
}
