
import 'package:learnhub/features/courses/presentation/data/course_model.dart';

sealed class GetBoughtCoursesState {}

final class GetBoughtCoursesInitial extends GetBoughtCoursesState {}

final class GetBoughtCoursesLoading extends GetBoughtCoursesState {}

final class GetBoughtCoursesSuccess extends GetBoughtCoursesState {
  final List<CourseModel> boughtCourses;

  GetBoughtCoursesSuccess({required this.boughtCourses});
}

final class GetBoughtCoursesFailure extends GetBoughtCoursesState {
  final String message;

  GetBoughtCoursesFailure(this.message);
}
