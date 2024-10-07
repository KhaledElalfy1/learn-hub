import 'package:flutter/material.dart';
import 'package:learnhub/features/courses/presentation/view/widgets/courses_category_item.dart';

class CoursesCategoriesListView extends StatelessWidget {
  const CoursesCategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 110,
        child: ListView.separated(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) => const CoursesCategoryItem(
            backgroundColor: Color(0xffCEECFE),
            imagePath: 'assets/svg/sliderimage1.svg',
            title: 'Language',
            titleColor: Color(0xffF3FBFF),
          ),
          separatorBuilder: (context, index) => const SizedBox(width: 16.0),
        ),
      ),
    );
  }
}
