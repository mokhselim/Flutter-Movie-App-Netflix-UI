import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neo_old_movies/shared/cubit/app_cubit/app_cubit.dart';
import 'package:neo_old_movies/style/text_styles.dart';

class HomeHeader extends StatelessWidget {
  final double height;
  final AppCubit cubit;
  HomeHeader({this.height = 450, required this.cubit});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.transparent,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            image: DecorationImage(
              image: AssetImage('assets/poster.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.transparent,
                Colors.transparent,
                Colors.transparent,
                Colors.black87,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  cubit.navBarIndex(3);
                },
                child: Column(
                  children: [
                    Icon(
                      CupertinoIcons.add,
                      color: Colors.white,
                    ),
                    Text(
                      'My List',
                      style: arabicStyle,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2),
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 4,
                ),
                child: InkWell(
                  onTap: () {
                    cubit.navBarIndex(2);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.play_fill,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          'Play',
                          style: arabicStyle.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Icon(
                    CupertinoIcons.info_circle,
                    color: Colors.white,
                  ),
                  Text(
                    'info',
                    style: arabicStyle,
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
