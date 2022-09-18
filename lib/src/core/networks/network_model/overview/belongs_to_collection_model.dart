class BelongsToCollectionModel {
  final dynamic name, posterPath, backdropPath, id;

  BelongsToCollectionModel(
      {this.id, this.name, this.posterPath, this.backdropPath});

  factory BelongsToCollectionModel.fromJson(dynamic json) {
    return BelongsToCollectionModel(
        id: json['id'] ?? "",
        name: json['name'] ?? "",
        backdropPath: json['backdrop_path'] ?? "",
        posterPath: json['poster_path'] ?? "");
  }
}
