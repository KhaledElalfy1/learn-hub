import 'package:flutter/material.dart';
import 'package:learnhub/features/home/presentation/components/course_progress_widget.dart';
import 'package:learnhub/features/home/presentation/components/courses_offers_widget.dart';
import 'package:learnhub/features/home/presentation/components/user_info_widget.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: UserInfoWidget(),
              ),
              Expanded(
                flex: 3,
                child: CoursesOffersWidget(),
              ),
            ],
          ),
          Positioned(top: 100, child: CourseProgressWidget()),
        ],
      ),
    );
  }
}
