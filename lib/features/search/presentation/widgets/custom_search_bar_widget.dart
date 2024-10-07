import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:learnhub/core/managers/color_manager.dart';
import 'package:learnhub/core/managers/string_manager.dart';
import 'package:learnhub/core/managers/style_manager.dart';
import 'package:learnhub/features/search/presentation/cubit/search_courses_cubit.dart';
import 'package:learnhub/features/search/presentation/cubit/search_courses_state.dart';

class CustomSearchBarWidget extends StatelessWidget {
  const CustomSearchBarWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCoursesCubit, SearchCoursesState>(builder: (_, state) {
      
      return Padding(
        padding:  EdgeInsets.only(left: 0.03.sw,top: 0.1.sh,bottom: 0.02.sh),

        child: SearchBar(
          hintText: StringManager.searchBarHintTxt,
        
          backgroundColor:
              const WidgetStatePropertyAll<Color>(ColorManager.lighterGreyy),
          elevation: const WidgetStatePropertyAll<double>(0.1),
          hintStyle: WidgetStatePropertyAll<TextStyle>(
              StyleManager.descriptionPoppins(
                  color: ColorManager.lighterGrey)),
          shape: WidgetStatePropertyAll<OutlinedBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
        
          constraints: BoxConstraints(maxWidth: 0.9.sw, minHeight: 0.06.sh),
        
          onChanged: (searchBarContentText) =>
              searchBarOnChange(context, searchBarContentText),
        
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
      );
    });
  }
}

void searchBarOnChange(BuildContext context, String searchBarContentText) =>
    context
        .read<SearchCoursesCubit>()
        .searchBarOnChangeFunc(searchBarContentText: searchBarContentText);
        

