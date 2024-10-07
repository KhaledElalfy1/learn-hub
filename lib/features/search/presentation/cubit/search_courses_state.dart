import 'package:learnhub/features/search/domain/entities/course_details_entity.dart';

abstract class SearchCoursesState {}

class InitialState extends SearchCoursesState {
  List<CourseDetailsEntity> courses;
  List<String> courseCategories;

  InitialState({required this.courses, required this.courseCategories});
}

class ChangeContentOfSearchBarState extends SearchCoursesState {
  String searchBarContentText;
  List<CourseDetailsEntity> foundCourses;
  List<String> courseCategories;

  ChangeContentOfSearchBarState(
      {required this.searchBarContentText,
      required this.foundCourses,
      required this.courseCategories});
}
