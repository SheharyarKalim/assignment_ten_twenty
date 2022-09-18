class MoviesModel {
  final String iso_639_1, iso_3166_1, name, key, site, type, published_at, id;

  final int size;
  final bool official;

  MoviesModel(
      {required this.iso_639_1,
      required this.iso_3166_1,
      required this.name,
      required this.key,
      required this.site,
      required this.type,
      required this.published_at,
      required this.id,
      required this.size,
      required this.official});

  factory MoviesModel.fromJson(dynamic json) {
    return MoviesModel(
        iso_639_1: json['iso_639_1'],
        iso_3166_1: json['iso_3166_1'],
        name: json['name'],
        key: json['key'],
        site: json['site'],
        type: json['type'],
        published_at: json['published_at'],
        id: json['id'],
        size: json['size'],
        official: json['official']);
  }
}
