import 'package:flutter/material.dart';
import 'package:learnhub/home/presentation/components/current_courses_progress.dart';
import 'package:learnhub/home/presentation/components/meetup_widget.dart';
import 'package:learnhub/home/presentation/components/slider_widget.dart';

class CoursesOffersWidget extends StatelessWidget {
  const CoursesOffersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.white,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 35),
          SliderWidget(),
          SizedBox(height: 20),
          Text(
            'Learning Plan',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 15),
          CurrentCoursesProgress(
            course: 'Packaging Design',
            watched: '20',
            total: '30',
          ),
          SizedBox(height: 10),
          CurrentCoursesProgress(
            course: 'Logo Design',
            watched: '5',
            total: '20',
          ),
          SizedBox(height: 25),
          MeetUp(),
        ],
      ),
    );
  }
}
