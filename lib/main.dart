import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:neo_old_movies/modules/layout/layout_screen.dart';
import 'package:neo_old_movies/shared/cubit/bloc_observer/bloc_observer.dart';
import 'package:neo_old_movies/shared/network/local/cache_helper.dart';
import 'package:neo_old_movies/style/colors.dart';
import 'componantes/constants/constants.dart';
import 'models/user_models/login_model.dart';
import 'modules/user/user_navigate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await MobileAds.instance.initialize();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  gotUser = await CacheHelper.getData(key: 'gotUser');
  if (gotUser == true) {
    loginModel = LoginModel(
      uId: await CacheHelper.getData(key: 'uId'),
      email: await CacheHelper.getData(key: 'email'),
    );
  }
  Widget initialWidget() {
    if (loginModel == null) return UserNavigate();
    return LayoutScreen();
  }
  runApp(MyApp(initialWidget()));
}

class MyApp extends StatelessWidget {
  final Widget initialWidget;
  MyApp(this.initialWidget);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          iconTheme: IconThemeData(color: Colors.white, size: 20),
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: backgroundColor,
          appBarTheme: AppBarTheme(
              elevation: 0,
              backgroundColor: backgroundColor,
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.light))),
      debugShowCheckedModeBanner: false,
      home: initialWidget,
    );
  }
}
