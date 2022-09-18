import 'package:get/get.dart';

import '../../../core/networks/network_model/overview/movies_model.dart';
import '../../../core/networks/network_model/overview/overview_model.dart';
import '../../../core/networks/services/overview/details_of_movie_service.dart';

class OverviewViewModel extends GetxController {
  OverviewModels? details;
  final RxList<MoviesModel> moviesList = <MoviesModel>[].obs;
  final RxBool _loading = false.obs;

  bool get loading => _loading.value;

  set loading(bool value) {
    _loading.value = value;
  }

  @override
  onInit() {
    super.onInit();
    getDetailOfMovie(id: Get.arguments[0]);
    getMovies(id: Get.arguments[0]);
  }

  getDetailOfMovie({required int id}) {
    DetailsOfMovieService(id: id).getRequestApi(onSuccess: (response) {
      details = response;
      update();
    }, onError: (onError) {
      print("error: $onError");
    });
  }

  getMovies({required int id}) {
    DetailsOfMovieService(id: id).getRequestVideos(
        onSuccess: (response) {
          moviesList.addAll(response);
        },
        onError: (onError) {
          print("error: $onError");
        });
  }
}
