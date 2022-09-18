import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/colors/app_colors.dart';
import '../../widgets/search/custom_list_tile.dart';
import '../../widgets/search/grid_list.dart';
import '../../widgets/search/search_textField.dart';
import 'search_viewModel.dart';

class Search extends StatelessWidget {
  static const String id = "/SEARCH";

  Search({Key? key}) : super(key: key);

  final searchViewModel = Get.find<SearchViewModel>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: searchTextField(context: context, searchOnTap: () {
          searchViewModel.tappedSearchBar();
        },
        onChanged: (value){
          searchViewModel.filterSearch(query: value);
        }),
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: AppColors.instance.listGradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
            child: searchViewModel.searchAllList.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.instance.black,
                    ),
                  )
                : searchViewModel.tapped
                    ? const CustomListTile()
                    : const GridList()),
      ),
    );
  }
}
