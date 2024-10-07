import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnhub/features/courses/presentation/view/widgets/course_selected_section.dart';

import 'package:learnhub/features/courses/presentation/view/widgets/courses_app_bar.dart';
import 'package:learnhub/features/courses/presentation/view/widgets/courses_by_filter_list.dart';
import 'package:learnhub/features/courses/presentation/view/widgets/courses_categories_list_view.dart';
import 'package:learnhub/features/courses/presentation/view/widgets/custom_search_bar_widget.dart';
import 'package:learnhub/features/courses/presentation/view/widgets/sliver_sized_box.dart';
import 'package:learnhub/features/courses/presentation/view_model/chosen_courses_cubit/chosen_courses_cubit.dart';
import 'package:learnhub/features/courses/presentation/view_model/search_bar_cubit/search_bar_cubit.dart';
import 'package:learnhub/features/courses/presentation/view_model/search_bar_cubit/search_bar_state.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 16.0.h),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: CoursesAppBar(),
              ),
              SliverSizedBox(height: 16.h),
              SliverSizedBox(
                child: CustomSearchBarWidget(
                  courses: ChosenCoursesCubit.get(context).courseChosenMap[
                      ChosenCoursesCubit.get(context).courseChosen[
                          ChosenCoursesCubit.get(context).selectedIndex]],
                ),
              ),
              SliverSizedBox(height: 34.h),
              const CoursesCategoriesListView(),
              SliverSizedBox(height: 34.h),
              const SliverToBoxAdapter(
                child: Text(
                  'Choice your course',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SliverSizedBox(height: 16.h),
              const CourseSelectedSection(),
              SliverSizedBox(height: 16.h),
              BlocBuilder<SearchBarCubit, SearchBarState>(
                builder: (context, state) {
                  return CoursesByFilterList(
                    filteredCourses:
                        BlocProvider.of<SearchBarCubit>(context).result,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
