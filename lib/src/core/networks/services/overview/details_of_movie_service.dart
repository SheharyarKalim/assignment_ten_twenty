import '../../network_model/overview/movies_model.dart';
import '../../network_model/overview/overview_model.dart';
import '../../repository/api_repository.dart';

class DetailsOfMovieService {
  final int id;

  DetailsOfMovieService({required this.id});

  final String url = "https://api.themoviedb.org/3/movie/";

  final Map<String, dynamic> params = {
    "api_key": "49e0a63509f7e703235545634cbaa999"
  };

  getRequestApi({
    Function? beforeSend,
    Function(OverviewModels resultList)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    ApiRepository(baseUrl: "$url$id", params: params).get(
        onSuccess: (responseData) {
      if (onSuccess != null) {
        onSuccess(OverviewModels.fromJson(responseData));
      }
    }, onError: (error) {
      if (onError != null) {
        onError(error);
      }
    });
  }

  getRequestVideos({
    Function? beforeSend,
    Function(List<MoviesModel> resultList)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    ApiRepository(baseUrl: "$url$id/videos", params: params).get(
        onSuccess: (responseData) {
      if (onSuccess != null) {
        onSuccess((responseData['results'] as List)
            .map((e) => MoviesModel.fromJson(e))
            .toList());
      }
    }, onError: (error) {
      if (onError != null) {
        onError(error);
      }
    });
  }
}
