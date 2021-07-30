import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neo_old_movies/componantes/componantes/componantes.dart';
import 'package:neo_old_movies/modules/layout/layout_screen.dart';
import 'package:neo_old_movies/modules/user/login_screen.dart';
import 'package:neo_old_movies/modules/user/register_screen.dart';
import 'package:neo_old_movies/style/colors.dart';
import 'package:neo_old_movies/style/text_styles.dart';

class UserNavigate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black,
                          Colors.grey.shade800,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      image: DecorationImage(
                          image: AssetImage('assets/female.png'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              Expanded(

                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  margin: EdgeInsets.only(top: 80),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Enjoy Our BIG Collection Of \n Movies',
                        style: arabicStyle.copyWith(
                            fontSize: 28, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        children: [
                          userButton((){
                            navigateTo(context, RegisterScreen(login: false));
                          },'register'),
                          userButton((){
                            navigateTo(context, RegisterScreen(login: true));

                          },'login'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            splashColor: Colors.black,
            onTap: () {
              navigateToAndRemove(context, LayoutScreen());
            },
            child: Container(
              margin: EdgeInsets.only(left: 4, top: 30),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(5),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'SKIP',
                    style: englishStyle.copyWith(color: userColor),
                  ),
                  Icon(
                    Icons.cancel,
                    color: userColor,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget userButton ( Function onPressed ,String title){
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(1),
        margin: EdgeInsets.only(bottom: 40, right: 2),
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: userColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextButton(
            onPressed: () {
             onPressed();
            },
            child: Text(
              title.toUpperCase(),
              style: englishStyle.copyWith(
                  color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
