class GenresModel {
  final dynamic genresId, genresName;

  GenresModel({required this.genresId, required this.genresName});

  factory GenresModel.fromJson (dynamic json){
    return GenresModel(genresId: json['id'], genresName: json['name']);
  }
}