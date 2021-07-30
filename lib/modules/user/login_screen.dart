import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:neo_old_movies/componantes/componantes/componantes.dart';
import 'package:neo_old_movies/modules/layout/layout_screen.dart';
import 'package:neo_old_movies/shared/cubit/user_cubit/user_cubit.dart';
import 'package:neo_old_movies/shared/cubit/user_cubit/user_states.dart';
import 'package:neo_old_movies/style/colors.dart';
import 'package:neo_old_movies/style/text_styles.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => UserCubit(),
      child: BlocConsumer<UserCubit, UserStates>(
        listener: (BuildContext context, state) {
          if (state is UserLoginErrorState) {
            Fluttertoast.showToast(
                msg: state.onError,
                backgroundColor: Colors.red,
                gravity: ToastGravity.CENTER,
                toastLength: Toast.LENGTH_LONG);
          }
          if (state is UserLoginSuccessState) {
            navigateToAndRemove(context, LayoutScreen());
          }
        },
        builder: (BuildContext context, Object? state) {
          var cubit = UserCubit.get(context);
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black,
                            Colors.black,
                            Colors.grey.shade800,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        image: DecorationImage(
                            alignment: Alignment.centerLeft,
                            image: AssetImage('assets/femalelogin.png'),
                            fit: BoxFit.cover),
                        color: Colors.grey[850],
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: [
                              defaultTextFormField(
                                perfixIcon: Icon(
                                  CupertinoIcons.mail,
                                  color: userColor,
                                ),
                                hint: 'MAIL',
                                inputType: TextInputType.emailAddress,
                                textEditingController: emailController,
                              ),
                              SizedBox(height: 20),
                              defaultTextFormField(
                                perfixIcon: Icon(
                                  CupertinoIcons.lock,
                                  color: userColor,
                                ),
                                hint: 'PASSWORD',
                                inputType: TextInputType.visiblePassword,
                                textEditingController: passwordController,
                                isPassword: !cubit.showPassword,
                                suffixIcon: IconButton(
                                  icon: cubit.showPassword
                                      ? Icon(
                                          CupertinoIcons.eye,
                                          color: userColor,
                                        )
                                      : Icon(
                                          CupertinoIcons.eye_slash,
                                          color: userColor,
                                        ),
                                  onPressed: () {
                                    cubit.passWordState();
                                  },
                                ),
                              ),
                              SizedBox(height: 40),
                              CupertinoButton(
                                color: userColor,
                                child: Text(
                                  'LOGIN',
                                  style: englishStyle.copyWith(
                                      fontSize: 14, color: Colors.black),
                                ),
                                onPressed: () {
                                  cubit.login(
                                      email: emailController.text,
                                      password: passwordController.text);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
