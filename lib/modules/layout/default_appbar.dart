

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neo_old_movies/style/colors.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;

  const CustomAppBar({

    this.scrollOffset = 0.0,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 24.0,
      ),
      color:
      backgroundColor.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: _CustomAppBarMobile()
    );
  }
}

class _CustomAppBarMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.network('https://camo.envatousercontent.com/8b6de2c1f7341a07dee884684f9d7f0b8aeb274c/687474703a2f2f7669726d616e612e636f6d2f696d616765732f66756c6c5f666c69785f322e706e67'),
          const SizedBox(width: 2.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                  title: 'TV Shows',
                  onTap: () => print('TV Shows'),
                ),
                _AppBarButton(
                  title: 'Movies',
                  onTap: () => print('Movies'),
                ),
                _AppBarButton(
                  title: 'My List',
                  onTap: () => print('My List'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class _AppBarButton extends StatelessWidget {
  final String title;
  final  onTap;

  const _AppBarButton({

    required this.title,
    required this.onTap,
  }) ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

