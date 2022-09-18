import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/networks/network_model/watch/results.dart';
import '../watch/watch_viewModel.dart';

class SearchViewModel extends GetxController {
  final searchTextController = TextEditingController();
  final RxBool _isSearching = false.obs;

  bool get isSearching => _isSearching.value;

  set isSearching(bool value) {
    _isSearching.value = value;
  }

  final RxBool _tapped = false.obs;

  bool get tapped => _tapped.value;

  set tapped(bool value) {
    _tapped.value = value;
  }

  final watchViewModel = Get.find<WatchViewModel>();
  RxList<ResultsModel> searchAllList = <ResultsModel>[].obs;
  RxList<ResultsModel> displayList = <ResultsModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getSearchList();
  }

  getSearchList() {
    searchAllList.addAll(watchViewModel.moviesList);
  }

  tappedSearchBar() {
    tapped = true;
    displayList.value = List.from(searchAllList);
  }

  filterSearch({required String query}) {
    tapped = true;
    displayList.value = searchAllList
        .where((results) =>
            results.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    print(displayList.length);
  }
}
