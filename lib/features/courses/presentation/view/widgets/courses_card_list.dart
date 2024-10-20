import 'package:flutter/material.dart';
import 'package:learnhub/core/navigation/routes.dart';
import 'package:learnhub/features/courses/presentation/data/course_model.dart';
import 'package:learnhub/features/courses/presentation/view/widgets/course_card.dart';

class CoursesCardList extends StatelessWidget {
  const CoursesCardList({super.key, required this.course});
  final List<CourseModel> course;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: course.length,
      itemBuilder: (context, index) =>  InkWell(
        onTap: ()=> Navigator.pushNamed(context, Routes.courseDetails, arguments: course[index]),
        child: CourseCard(
          course: course[index],
        ),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 16.0),
    );
  }
}
