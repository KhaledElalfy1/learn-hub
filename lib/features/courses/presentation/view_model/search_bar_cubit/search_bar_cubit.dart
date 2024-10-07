import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnhub/features/courses/presentation/data/course_model.dart';
import 'package:learnhub/features/courses/presentation/view_model/search_bar_cubit/search_bar_state.dart';

class SearchBarCubit extends Cubit<SearchBarState> {

  SearchBarCubit() : super(InitialState());
   List<CourseModel> result = [];
  void searchBarOnChangeFunc({required String searchBarContentText,required List<CourseModel> courses}) {
   

    if (searchBarContentText.isEmpty) {
      result = [];

      emit(InitialState());
    } else {
      result = courses
          .where((element) => element.title
              .toLowerCase()
              .trim()
              .contains(searchBarContentText.toLowerCase().trim()))
          .toList();

      emit(ChangeContentOfSearchBarState(
          searchBarContentText: searchBarContentText, foundCourses: result));
    }
  }
}
