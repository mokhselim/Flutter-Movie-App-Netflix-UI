import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_old_movies/componantes/componantes/componantes.dart';
import 'package:neo_old_movies/models/movie_model/movie_model.dart';
import 'package:neo_old_movies/modules/video_player/video_player.dart';
import 'package:neo_old_movies/shared/cubit/app_cubit/app_cubit.dart';
import 'package:neo_old_movies/shared/cubit/app_cubit/app_states.dart';
import 'package:neo_old_movies/style/text_styles.dart';

class MovieScreen extends StatelessWidget {
  final MovieModel movie;
  MovieScreen(this.movie);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                height: 1100,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: CachedNetworkImage(
                        width: double.infinity,
                        height: 370,
                        imageUrl: movie.photo,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        alignment: Alignment.topLeft,
                        padding:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        width: double.infinity,
                        color: Colors.white.withOpacity(0.06),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.movieName,
                              style: arabicStyle.copyWith(fontSize: 20),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Details',
                                  style: arabicStyle.copyWith(
                                      color: Colors.green, fontSize: 14),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '${movie.year}',
                                  style: arabicStyle.copyWith(
                                      fontSize: 16, color: Colors.white),
                                  textAlign: TextAlign.end,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  movie.time,
                                  style: arabicStyle.copyWith(
                                      fontSize: 14, color: Colors.white70),
                                ),
                                SizedBox(
                                  width: 0,
                                ),
                                Icon(
                                  Icons.hd_outlined,
                                  color: Colors.white70,
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 3, horizontal: 2),
                                  decoration: BoxDecoration(
                                      color: Colors.red[900],
                                      borderRadius: BorderRadius.circular(2)),
                                  child: Text(
                                    'Top\n10',
                                    style: arabicStyle.copyWith(
                                        fontSize: 10,
                                        color: Colors.white,
                                        height: 0.8,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '# In Top10 Today',
                                  style: arabicStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 35,
                              child: CupertinoButton(
                                  padding: EdgeInsets.symmetric(vertical: 0),
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.grey[300],
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        CupertinoIcons.play_fill,
                                        color: Colors.black,
                                        size: 16,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        'Play',
                                        style: arabicStyle.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      )
                                    ],
                                  ),
                                  onPressed: () {
                                    cubit.setViews(movie);
                                    navigateTo(context,
                                        VideoPlayer(movie.youtubeLink));
                                  }),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 35,
                              child: CupertinoButton(
                                  padding: EdgeInsets.symmetric(vertical: 0),
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.white.withOpacity(0.1),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.phone_iphone_outlined,
                                        size: 16,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        'Download',
                                        style: arabicStyle.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      )
                                    ],
                                  ),
                                  onPressed: () {}),
                            ),
                            Divider(
                              height: 20,
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Story',
                              style: arabicStyle.copyWith(
                                  fontSize: 22, color: Colors.red[300]),
                            ),
                            Text(
                              movie.storyDescription,
                              style: arabicStyle.copyWith(
                                color: Colors.white.withOpacity(0.95),
                              ),
                              maxLines: 4,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Crew',
                              style: arabicStyle.copyWith(
                                  fontSize: 22, color: Colors.red[300]),
                            ),
                            Text(
                              movie.crew,
                              style: arabicStyle.copyWith(
                                color: Colors.white.withOpacity(0.95),
                              ),
                              maxLines: 4,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {
                                        cubit.userList(movie.id!);
                                      },
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'My List',
                                      style: arabicStyle,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                      icon: Icon(CupertinoIcons.heart),
                                      onPressed: () {},
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'Rate',
                                      style: arabicStyle,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.share),
                                      onPressed: () {},
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'Share',
                                      style: arabicStyle,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              height: 4,
                              width: 80,
                              color: Colors.red[900],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
