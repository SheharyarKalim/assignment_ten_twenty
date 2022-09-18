import 'package:get/get.dart';

import '../../../core/networks/network_model/watch/results.dart';
import '../../../core/networks/services/watch/watch_list_service.dart';

class WatchViewModel extends GetxController {
  final RxList<ResultsModel> moviesList = <ResultsModel>[].obs;

  final RxBool _isSearching = false.obs;

  bool get isSearching => _isSearching.value;

  set isSearching(bool value) {
    _isSearching.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    getMoviesList();
  }

  getMoviesList() {
    WatchListService().postRequestApi(onSuccess: (responseList) {
      moviesList.value = responseList;
      }, onError: (error) {
      print(error);
    });
  }

  List sendArguments({required int index}){
    return [
      moviesList[index].id,
    ];
  }
}
