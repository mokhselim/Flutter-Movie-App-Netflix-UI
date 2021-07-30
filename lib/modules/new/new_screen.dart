import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neo_old_movies/componantes/componantes/componantes.dart';
import 'package:neo_old_movies/modules/movie/movie_screen.dart';
import 'package:neo_old_movies/modules/video_player/video_player.dart';
import 'package:neo_old_movies/shared/cubit/app_cubit/app_cubit.dart';
import 'package:neo_old_movies/style/text_styles.dart';

class NewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New & 🔥',
          style: englishStyle.copyWith(fontSize: 22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 3, horizontal: 2),
                        decoration: BoxDecoration(
                            color: Colors.red[800],
                            borderRadius: BorderRadius.circular(4)),
                        child: Text(
                          'Top\n10',
                          style: arabicStyle.copyWith(
                              fontSize: 9,
                              color: Colors.white,
                              height: 0.7,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Top 10',
                        style: englishStyle.copyWith(
                            fontSize: 14, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.separated(
                  primary: false,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        navigateTo(
                            context, MovieScreen(cubit.mostViewedList[index]));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 40,
                                child: Text(
                                  '${index + 1}',
                                  style: arabicStyle.copyWith(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  height: 250,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.network(
                                    cubit.mostViewedList[index].photo,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  Icon(Icons.share),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    'Share',
                                    style: arabicStyle,
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  Icon(Icons.add),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    'My List',
                                    style: arabicStyle,
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    iconSize: 18,
                                    icon: Column(
                                      children: [
                                        Icon(CupertinoIcons.play_arrow_solid),
                                        Text(
                                          'Play',
                                          style: arabicStyle,
                                        ),
                                      ],
                                    ),
                                    onPressed: () {
                                      navigateTo(
                                          context,
                                          VideoPlayer(cubit
                                              .mostViewedList[index]
                                              .youtubeLink));
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Expanded(
                                    child: Text(
                                      cubit.mostViewedList[index].movieName,
                                      style: arabicStyle.copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Expanded(
                                      child: Text(
                                    cubit
                                        .mostViewedList[index].storyDescription,
                                    style: arabicStyle.copyWith(
                                        color: Colors.grey),
                                  ))
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: cubit.moviesList.length < 10
                      ? cubit.mostViewedList.length
                      : 10),
            ),
          ],
        ),
      ),
    );
  }
}
