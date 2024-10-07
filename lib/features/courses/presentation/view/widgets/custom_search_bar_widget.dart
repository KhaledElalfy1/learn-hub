import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:learnhub/core/managers/color_manager.dart';
import 'package:learnhub/features/courses/presentation/data/course_model.dart';
import 'package:learnhub/features/courses/presentation/view_model/search_bar_cubit/search_bar_cubit.dart';

import '../../view_model/search_bar_cubit/search_bar_state.dart';
import 'package:learnhub/core/managers/style_manager.dart';

class CustomSearchBarWidget extends StatelessWidget {
  const CustomSearchBarWidget({super.key, required this.courses});
  final List<CourseModel> courses;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBarCubit, SearchBarState>(builder: (_, state) {
      return Column(
        children: [
          SearchBar(
            hintText: 'Search Course', //StringManager.searchBarHintTxt,

            backgroundColor:
                const WidgetStatePropertyAll<Color>(ColorManager.lighterGreyy),
            elevation: const WidgetStatePropertyAll<double>(0.1),
            hintStyle: WidgetStatePropertyAll<TextStyle>(
                StyleManager.descriptionPoppins(
                    color: ColorManager.lighterGrey)),
            shape: WidgetStatePropertyAll<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
            ),

            constraints: BoxConstraints(maxWidth: 0.8.sw, minHeight: 0.06.sh),

            onChanged: (searchBarContentText) =>
                searchBarOnChange(context, searchBarContentText,courses),

            leading: const Icon(
              Icons.search,
              color: ColorManager.darkGrey,
            ),
            trailing: [
              IconButton(
                icon: const Icon(Icons.format_list_bulleted_rounded),
                color: ColorManager.darkGrey,
                onPressed: () => {},
              )
            ],
          ),
        ],
      );
    });
  }
}

void searchBarOnChange(BuildContext context, String searchBarContentText,List<CourseModel> courses) =>
    context
        .read<SearchBarCubit>()
        .searchBarOnChangeFunc(searchBarContentText: searchBarContentText,courses:courses);
