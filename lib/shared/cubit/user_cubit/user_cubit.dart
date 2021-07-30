import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_old_movies/componantes/constants/constants.dart';
import 'package:neo_old_movies/models/user_models/login_model.dart';
import 'package:neo_old_movies/shared/cubit/app_cubit/app_cubit.dart';
import 'package:neo_old_movies/shared/cubit/user_cubit/user_states.dart';
import 'package:neo_old_movies/shared/network/local/cache_helper.dart';

class UserCubit extends Cubit<UserStates> {
  UserCubit() : super(UserInitialState());

  static UserCubit get(context) => BlocProvider.of(context);

  bool showPassword = false;
  void passWordState() {
    showPassword = !showPassword;
    emit(UserShowPasswordState());
  }

  Future<void> userData() async {
    emit(AppUserDataLoadingState());
    await FirebaseFirestore.instance
        .collection('users')
        .doc(loginModel!.uId)
        .set({'id': loginModel!.uId})
        .then((value) {
      emit(AppUserDataSuccessState());
    }).catchError((onError) {
      emit(AppUserDataErrorState(onError.toString()));
    });
  }




  void register({required String email, required String password}) async {
    emit(UserRegisterLoadingState());
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      loginModel = LoginModel(uId: value.user!.uid,email: email );
      gotUser = true ;
      await CacheHelper.setData(key: 'uId', value: value.user!.uid);
      await CacheHelper.setData(key: 'email', value: value.user!.email);
      await CacheHelper.setData(key: 'gotUser', value: true);
      emit(UserRegisterSuccessState());
     await userData();
    }).catchError((onError) {
      print(onError.toString());
      emit(UserRegisterErrorState(onError.toString()));
    });
  }

  void login({required String email, required String password}) async {
    emit(UserLoginLoadingState());
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      loginModel = LoginModel(uId: value.user!.uid, email: email);
      gotUser =true;
      await CacheHelper.setData(key: 'uId', value: value.user!.uid);
      await CacheHelper.setData(key: 'email', value: value.user!.email);
      await CacheHelper.setData(key: 'gotUser', value: true);
      emit(UserLoginSuccessState());

    }).catchError((onError) {
      print(onError.toString());
      emit(UserLoginErrorState(onError.toString()));
    });
  }
}
