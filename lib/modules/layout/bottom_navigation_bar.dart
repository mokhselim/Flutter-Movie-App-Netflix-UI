import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neo_old_movies/shared/cubit/app_cubit/app_cubit.dart';
import 'package:neo_old_movies/style/colors.dart';

final Map<String, IconData> _icons = const {
  'Home': CupertinoIcons.home,
  'New & 🔥': CupertinoIcons.rectangle_on_rectangle_angled,
  'All Movies': CupertinoIcons.tv,
  'My List': CupertinoIcons.square_list,
};

BottomNavigationBar defaultNavBar(AppCubit cubit) {
  return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor:backgroundColor,
      items: _icons
          .map((title, icon) => MapEntry(
              title,
              BottomNavigationBarItem(
                icon: Icon(icon, size: 20.0),
                label: title,
              )))
          .values
          .toList(),
      currentIndex: cubit.navBar,
      selectedItemColor: Colors.white,
      selectedFontSize: 11.0,
      unselectedItemColor: Colors.grey,
      unselectedFontSize: 9.0,
      onTap: (index) {
        cubit.navBarIndex(index);
      });
}
