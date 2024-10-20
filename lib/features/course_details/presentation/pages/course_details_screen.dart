import 'package:flutter/material.dart';
import 'package:learnhub/core/managers/color_manager.dart';
import 'package:learnhub/features/course_details/presentation/components/course_details_bottom_navigation_bar.dart';
import 'package:learnhub/features/course_details/presentation/components/course_details_main_container.dart';
import 'package:learnhub/features/course_details/presentation/components/course_details_top_area.dart';
import 'package:learnhub/features/course_details/presentation/components/play_video.dart';
import 'package:learnhub/features/courses/presentation/data/course_model.dart';

class CourseDetailsScreen extends StatelessWidget {
  const CourseDetailsScreen({super.key, required this.courseModel});
  final CourseModel courseModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.lightPink,
      body: Column(
        children: [
          CourseDetailsTopArea(
            courseName: courseModel.title,
          ),
          const PlayVideo(),
          CourseDetailsMainContainer(
            courseModel: courseModel,
          )
        ],
      ),
      bottomNavigationBar: const CourseDetailsBottomNavigationBar(),
    );
  }
}
