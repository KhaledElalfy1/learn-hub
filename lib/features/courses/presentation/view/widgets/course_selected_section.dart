import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnhub/features/courses/presentation/view/widgets/course_chosen_button.dart';
import 'package:learnhub/features/courses/presentation/view_model/chosen_courses_cubit/chosen_courses_cubit.dart';
import 'package:learnhub/features/courses/presentation/view_model/chosen_courses_cubit/chosen_courses_state.dart';

class CourseSelectedSection extends StatelessWidget {
  const CourseSelectedSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Wrap(
          spacing: 8.0.w,
          children: List.generate(
            ChosenCoursesCubit.get(context).courseChosen.length,
            (index) {
              return BlocBuilder<ChosenCoursesCubit, ChosenCoursesState>(
                builder: (context, state) {
                  return CourseChosenButton(
                    title: ChosenCoursesCubit.get(context).courseChosen[index],
                    isSelected:
                        ChosenCoursesCubit.get(context).selectedIndex == index,
                    onPressed: () {
                      ChosenCoursesCubit.get(context).selectIndex(index);
                    },
                  );
                },
              );
            },
          )),
    );
  }
}
