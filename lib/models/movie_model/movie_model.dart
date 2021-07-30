class MovieModel {

  late String? id;
  late  String youtubeLink;
  late  String movieName;
  late  String photo;
  late  int year;
  late  String storyDescription;
  late  String time;
  late  String crew;
  late  int watchedTimes;
  late  int trending;
  late  dynamic addingTime;
  MovieModel(
    this.id,
    this.youtubeLink,
    this.movieName,
    this.photo,
    this.year,
    this.storyDescription,
    this.time,
    this.crew,
    this.watchedTimes,
    this.trending,
    this.addingTime,
  );

  MovieModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    youtubeLink = json['youtubeLink'];
    movieName = json['movieName'];
    photo = json['photo'];
    year = json['year'];
    storyDescription = json['storyDescription'];
    time = json['time'];
    crew = json['crew'];
    watchedTimes = json['watchedTimes'];
    trending = json['trending'];
    addingTime = json['addingTime'];
  }
  Map <String, dynamic> toJson() {
    return {
      'id': id,
      'youtubeLink': youtubeLink,
      'movieName': movieName,
      'photo': photo,
      'year': year,
      'storyDescription': storyDescription,
      'time': time,
      'crew': crew,
      'watchedTimes': watchedTimes,
      'trending': trending,
      'addingTime': addingTime,
    };
  }
}
