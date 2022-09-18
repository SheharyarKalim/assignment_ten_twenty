import 'belongs_to_collection_model.dart';
import 'genres.dart';

class OverviewModels {
  final dynamic backDropPath,
      homepage,
      overview,
      status,
      releasedDate,
      title,
      adult,
      budget,
      id;

  final BelongsToCollectionModel? belongsToCollectionModel;
  final List<GenresModel>? genresModel;

  OverviewModels(
      {this.adult,
      this.backDropPath,
      this.homepage,
      this.overview,
      this.status,
      this.releasedDate,
      this.title,
      required this.belongsToCollectionModel,
      this.budget,
      this.genresModel,
      this.id});

  factory OverviewModels.fromJson(dynamic json) {
    return OverviewModels(
        adult: json['adult'],
        backDropPath: json['backdrop_path'],
        homepage: json['homepage'],
        overview: json['overview'],
        status: json['status'],
        releasedDate: json['release_date'],
        title: json['title'],
        belongsToCollectionModel: json['belongs_to_collection'] != null
            ? BelongsToCollectionModel.fromJson(json['belongs_to_collection'])
            : null,
        budget: json['budget'],
        genresModel: (json['genres'] as List)
            .map((e) => GenresModel.fromJson(e))
            .toList(),
        id: json['id']);
  }
}
