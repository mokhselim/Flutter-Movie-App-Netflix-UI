abstract class UserStates {}

class UserInitialState extends UserStates {}

class UserShowPasswordState extends UserStates {}

class UserRegisterLoadingState extends UserStates {}

class UserRegisterSuccessState extends UserStates {}

class UserRegisterErrorState extends UserStates {
  String onError;
  UserRegisterErrorState(this.onError);
}

class UserLoginLoadingState extends UserStates {}

class UserLoginSuccessState extends UserStates {}

class UserLoginErrorState extends UserStates {
  String onError;
  UserLoginErrorState(this.onError);
}

class AppUserDataLoadingState extends UserStates{}
class AppUserDataSuccessState extends UserStates{}
class AppUserDataErrorState extends UserStates{
  String onError;
  AppUserDataErrorState(this.onError);
}
