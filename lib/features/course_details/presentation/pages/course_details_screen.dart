import 'package:flutter/material.dart';
import 'package:learnhub/features/courses/presentation/data/course_model.dart';

import '../../../../core/managers/color_manager.dart';
import '../components/course_details_bottom_navigation_bar.dart';
import '../components/course_details_main_container.dart';
import '../components/course_details_top_area.dart';

class CourseDetailsScreen extends StatefulWidget {
  const CourseDetailsScreen({
    super.key,
    required this.courseModel,
  });
  final CourseModel courseModel;
  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.lightPink,
      body: Column(
        children: [
          Stack(
            children: [
              CourseDetailsTopArea(
                courseName: widget.courseModel.title,
                url: widget.courseModel.url,
              )
            ],
          ),
          CourseDetailsMainContainer(
            courseModel: widget.courseModel,
          )
        ],
      ),
      bottomNavigationBar: CourseDetailsBottomNavigationBar(
        courseModel: widget.courseModel,
      ),
    );
  }
}
