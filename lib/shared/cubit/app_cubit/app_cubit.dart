import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_old_movies/componantes/constants/constants.dart';
import 'package:neo_old_movies/models/movie_model/movie_model.dart';

import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int navBar = 0;

  void navBarIndex(int index) {
    navBar = index;
    emit(AppNavBarState());
  }

  void setViews(MovieModel movie) async {
    emit(AppSetMovieViewsLoadingState());
    movie.watchedTimes++;
    await FirebaseFirestore.instance
        .collection('movies')
        .doc(movie.id)
        .update(movie.toJson())
        .then((value) {
      emit(AppSetMovieViewsSuccessState());
    });
  }

  void setTrending(MovieModel movie) async {
    emit(AppSetMovieTrendingLoadingState());
    movie.trending++;
    await FirebaseFirestore.instance
        .collection('movies')
        .doc(movie.id)
        .update(movie.toJson())
        .then((value) {
      emit(AppSetMovieTrendingSuccessState());
    });
  }

  late List<String> moviesId = [];
  late List<MovieModel> moviesList = [];
  late List<MovieModel> mostViewedList = [];
  late List<MovieModel> trendingList = [];
  List<MovieModel> myList = [];

  void getMovies() {
    emit(AppGetMovieDataLoadingState());

    FirebaseFirestore.instance
        .collection('movies')
        .orderBy('addingTime')
        .snapshots()
        .listen((event) {
      moviesList = [];
      event.docs.reversed.forEach((element) {
        moviesList.add(MovieModel.fromJson(element.data()));
      });

      emit(AppGetMovieDataSuccessState());
    });
    FirebaseFirestore.instance
        .collection('movies')
        .orderBy('watchedTimes')
        .snapshots()
        .listen((event) {
      mostViewedList = [];
      event.docs.reversed.forEach((element) {
        mostViewedList.add(MovieModel.fromJson(element.data()));
      });

      emit(AppGetMovieDataSuccessState());
    });
    FirebaseFirestore.instance
        .collection('movies')
        .orderBy('trending')
        .snapshots()
        .listen((event) {
      trendingList = [];
      event.docs.reversed.forEach((element) {
        trendingList.add(MovieModel.fromJson(element.data()));
      });

      emit(AppGetMovieDataSuccessState());
    });
    getMoviesId();
  }

  void getMoviesId() {
    if (gotUser != null) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(loginModel!.uId)
          .collection('list')
          .snapshots()
          .listen((event) {
        moviesId = [];
        event.docs.forEach((element) {
          moviesId.add(element.id.toString());
        });
        emit(AppGetUserListSuccessState());
      });
    }
  }

  void getMyList() {
    if (moviesId.length >= 1)
      moviesId.forEach((element) {
        myList = [];
        FirebaseFirestore.instance
            .collection('movies')
            .doc(element.toString())
            .get()
            .then((value) {
              if (value.exists )
          myList.add(MovieModel.fromJson(value.data()!));

          emit(AppGetMyListSuccessState());
        });
      });
  }
  Future<void> userList(String movieId) async {
    if (gotUser != null) {
      emit(AppSetMyListLoadingState());
      await FirebaseFirestore.instance
          .collection('users')
          .doc(loginModel!.uId)
          .collection('list')
          .doc(movieId)
          .set({'id': movieId.toString()}).then((value) {
        emit(AppSetMyListSuccessState());
        getMoviesId();
      }).catchError((onError) {
        emit(AppSetMyListErrorState(onError.toString()));
      });
    }
  }


}
