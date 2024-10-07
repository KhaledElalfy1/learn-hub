import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:learnhub/features/search/presentation/cubit/search_courses_cubit.dart';
import 'package:learnhub/features/search/presentation/cubit/search_courses_state.dart';
import 'package:learnhub/features/search/presentation/widgets/custom_container_widget.dart';

class ListOfCategoriesOfCoursesWidget extends StatelessWidget {
  const ListOfCategoriesOfCoursesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<SearchCoursesCubit, SearchCoursesState>(
      builder: (_, state) {

        final initialState = state is InitialState;
        final changeState =state is ChangeContentOfSearchBarState;
        final courseCategoriesListLength= initialState?
        state.courseCategories.length:

        changeState?state.courseCategories.length:0;

        return SizedBox(
          width: 0.9.sw,
          height: 0.05.sh,

          child: ListView.builder
          (
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 0.03.sw),
              itemCount:courseCategoriesListLength,

              itemBuilder: (_, index) { 
                final courseItem=initialState? state.courseCategories[index]:
                changeState?state.courseCategories[index]:"";

                return CustomContainerWidget(courseCategory:courseItem,searchBarContentText: changeState?state.searchBarContentText:"", );

              }),
        );
      },
    );
  }
}
