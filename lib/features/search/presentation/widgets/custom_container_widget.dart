import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:learnhub/core/managers/color_manager.dart';
import 'package:learnhub/core/managers/style_manager.dart';
import 'package:learnhub/features/search/presentation/cubit/search_courses_cubit.dart';

class CustomContainerWidget extends StatelessWidget {
  final String courseCategory;
  final String searchBarContentText;

  const CustomContainerWidget({super.key, required this.courseCategory, required this.searchBarContentText});

  @override
  Widget build(BuildContext context) {
    return Container( 

      height: 0.05.sh,
      margin: EdgeInsets.only(right: 0.05.sw),
      padding: EdgeInsets.symmetric(horizontal: 0.02.sw),
      decoration: BoxDecoration(color: ColorManager.lighterGreyy,borderRadius: BorderRadius.circular(10)),
      
      child: InkWell(
  
        onTap: () =>inkwellOnTapFun(context: context,courseCategory: courseCategory, searchBarContentText: searchBarContentText),
      
        child: Center(
          child: Text(
            courseCategory,
            style: StyleManager.descriptionPoppins(),
          ),

        ),
      ),
    );
  }
}

void inkwellOnTapFun({required BuildContext context,required String courseCategory,required String searchBarContentText})=>
context.read<SearchCoursesCubit>().filterCoursesBasedOnSelectedCategory(selectedCategory:courseCategory, searchBarContentText: searchBarContentText ,);