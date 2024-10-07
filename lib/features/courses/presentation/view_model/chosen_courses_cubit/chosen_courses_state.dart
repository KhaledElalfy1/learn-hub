
import 'package:learnhub/features/courses/presentation/data/course_model.dart';

sealed class ChosenCoursesState {}

final class ChosenCoursesInitial extends ChosenCoursesState {}

final class ChosenCoursesSelected extends ChosenCoursesState {
  final List<CourseModel> courses;

  ChosenCoursesSelected({required this.courses});
}

