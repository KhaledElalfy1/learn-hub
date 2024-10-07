import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnhub/features/courses/presentation/data/course_model.dart';
import 'package:learnhub/features/courses/presentation/view_model/chosen_courses_cubit/chosen_courses_cubit.dart';
import 'package:learnhub/features/courses/presentation/view_model/chosen_courses_cubit/chosen_courses_state.dart';

import 'courses_card_list.dart';

class CoursesByFilterList extends StatelessWidget {
  const CoursesByFilterList({
    super.key, required this.filteredCourses,
  });
  final List<CourseModel> filteredCourses;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChosenCoursesCubit, ChosenCoursesState>(
      builder: (context, state) {
        if (state is ChosenCoursesSelected) {
          return CoursesCardList(course:filteredCourses.isEmpty? state.courses:filteredCourses);
        }
        return const SliverToBoxAdapter(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
