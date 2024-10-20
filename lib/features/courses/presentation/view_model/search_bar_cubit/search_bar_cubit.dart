import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnhub/features/courses/presentation/data/course_model.dart';
import 'package:learnhub/features/courses/presentation/view_model/search_bar_cubit/search_bar_state.dart';

class SearchBarCubit extends Cubit<SearchBarState> {
  SearchBarCubit() : super(InitialState());
  List<CourseModel> result = [];
  void searchBarOnChangeFunc({
  required String searchBarContentText,
  required List<CourseModel> courses,
  double? minPrice,
  double? maxPrice,
}) {
  result = [];

  if (searchBarContentText.isEmpty) {
    result = [];  
    emit(InitialState());
  }else {
    result = courses.where((element) {
    return element.title
        .toLowerCase()
        .trim()
        .contains(searchBarContentText.toLowerCase().trim());
  }).toList();

  if (minPrice != null && maxPrice != null) {
    result = result.where((element) {
      double? coursePrice = element.price == 'Free' ? 0 : double.tryParse(element.price);
      return coursePrice != null &&
          (element.price == 'Free' ||
          (coursePrice >= minPrice && coursePrice <= maxPrice));
    }).toList();
  }

  for (var item in result) {
    log(item.description);
  }


  emit(ChangeContentOfSearchBarState(
      searchBarContentText: searchBarContentText, foundCourses: result));
  }
}

}
