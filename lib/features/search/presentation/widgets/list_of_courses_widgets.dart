import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnhub/core/managers/color_manager.dart';

import 'package:learnhub/features/search/presentation/component/course_card_component.dart';
import 'package:learnhub/features/search/presentation/cubit/search_courses_cubit.dart';
import 'package:learnhub/features/search/presentation/cubit/search_courses_state.dart';

class ListOfCoursesWidgets extends StatelessWidget {
  const ListOfCoursesWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCoursesCubit, SearchCoursesState>(builder: (_, state) {

      final initialState = state is InitialState;
      final changeState = state is ChangeContentOfSearchBarState;

      return SizedBox(
        height: 0.55.sh,

        child: ListView.builder(

            itemCount: initialState
                ? state.courses.length
                : changeState
                    ? state.foundCourses.length
                    : 0,

            itemBuilder: (_, index) {
              final courseItem= initialState?state.courses[index]
              :changeState?state.foundCourses[index]:null;
             
              return InkWell(
                
                highlightColor: ColorManager.lighterGreyy,

                onTap: (){},

                child: CourseCard(
                    courseTitle: courseItem!.courseName,
                    courseAuthor: courseItem.courseAuthor,
                    coursePrice: courseItem.coursePrice,
                    courseDuration: courseItem.courseDuration,
                  ),
              );
                
                }
                ),
      );
    });
  }
}
