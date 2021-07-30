abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppScrollState extends AppStates {}

class AppNavBarState extends AppStates {}

class AppGetMovieDataLoadingState extends AppStates {}

class AppGetMovieDataSuccessState extends AppStates {}
class AppGetUserListSuccessState extends AppStates {}
class AppGetMyListSuccessState extends AppStates {}

class AppSetMyListSuccessState extends AppStates {}

class AppSetMyListLoadingState extends AppStates {}
class AppSetMyListErrorState extends AppStates {
  String onError;
  AppSetMyListErrorState(this.onError);
}

class AppSetMovieViewsLoadingState extends AppStates {}

class AppSetMovieViewsSuccessState extends AppStates {}

class AppSetMovieTrendingLoadingState extends AppStates {}

class AppSetMovieTrendingSuccessState extends AppStates {}

class AppGetMovieDataErrorState extends AppStates {
  String onError;
  AppGetMovieDataErrorState(this.onError);
}
class AppAdLoadingState extends AppStates {}

class AppAdSuccessState extends AppStates {}

class AppAdErrorState extends AppStates {
  String onError;
  AppAdErrorState(this.onError);
}
