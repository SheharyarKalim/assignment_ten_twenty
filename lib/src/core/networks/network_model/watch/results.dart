class ResultsModel {
  final bool adult, video;
  final List<dynamic> genreIds;
  final int id, voteCount;
  final dynamic popularity, voteAverage;
  final String backdropPath,
      originalLanguage,
      originalTitle,
      overview,
      posterPath,
      releaseDate,
      title;

  ResultsModel({required this.adult,
    required this.video,
    required this.genreIds,
    required this.id,
    required this.voteCount,
    required this.popularity,
    required this.voteAverage,
    required this.backdropPath,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title});

  factory ResultsModel.fromJson (dynamic json){
    return ResultsModel(adult: json['adult'],
        video: json['video'],
        genreIds: json['genre_ids'],
        id: json['id'],
        voteCount: json['vote_count'],
        popularity: json['popularity'],
        voteAverage: json['vote_average'],
        backdropPath: json['backdrop_path'],
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        releaseDate: json['release_date'],
        title: json['title']);
  }
}
