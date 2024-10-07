import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:learnhub/core/managers/string_manager.dart';
import 'package:learnhub/core/managers/style_manager.dart';
import 'package:learnhub/features/search/presentation/cubit/search_courses_cubit.dart';
import 'package:learnhub/features/search/presentation/widgets/custom_search_bar_widget.dart';
import 'package:learnhub/features/search/presentation/widgets/list_of_categories_of_courses_widget.dart';
import 'package:learnhub/features/search/presentation/widgets/list_of_courses_widgets.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: BlocProvider<SearchCoursesCubit>(
        create: (_)=>SearchCoursesCubit(),
        child: ListView(
          
          children: [
            const CustomSearchBarWidget(),
        
            const ListOfCategoriesOfCoursesWidget(),
        
            Padding(
              padding:  EdgeInsets.only(top: 0.04.sh,left: 0.05.sw),
              child: Text(
                StringManager.searchScreenResultsTxt,
                style: StyleManager.titlePoppins(),
              ),
            ),
        
            const ListOfCoursesWidgets()
          ],
        ),
      ),
    );
  }
}
