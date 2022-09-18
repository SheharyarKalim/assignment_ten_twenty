import '../../network_model/watch/results.dart';
import '../../repository/api_repository.dart';

class WatchListService {
  final String url = "https://api.themoviedb.org/3/movie/upcoming";
  final Map<String, dynamic> params = {
  "api_key": "49e0a63509f7e703235545634cbaa999"
  };
  postRequestApi({
    Function? beforeSend,
    Function(List<ResultsModel> resultList)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    ApiRepository(baseUrl: url, params: params).post(beforeSend: () {
      if (beforeSend != null) {
        beforeSend();
      }
    }, onSuccess: (responseData) {
      if(onSuccess !=null){
        onSuccess((responseData['results'] as List).map((e) => ResultsModel.fromJson(e)).toList());
      }
    }, onError: (error) {
      if (onError != null) {
        onError(error);
      }
    });
  }
}