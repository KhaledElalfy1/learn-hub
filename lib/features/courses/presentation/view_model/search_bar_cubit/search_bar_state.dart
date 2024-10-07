import 'package:learnhub/features/courses/presentation/data/course_model.dart';

abstract class SearchBarState {}

class InitialState extends SearchBarState {
}

class ChangeContentOfSearchBarState extends SearchBarState {
  String searchBarContentText;
  List<CourseModel>? foundCourses;

  ChangeContentOfSearchBarState(
      {required this.searchBarContentText,
      required this.foundCourses,
      });
}
