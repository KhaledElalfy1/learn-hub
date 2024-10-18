import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CurrentCoursesProgress extends StatelessWidget {
  const CurrentCoursesProgress(
      {super.key,
      required this.course,
      required this.watched,
      required this.total});
  final String course;
  final String watched, total;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircularPercentIndicator(
          radius: 9,
          percent: int.parse(watched) / int.parse(total),
          progressColor: const Color(0xff707070),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          course,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        Text(
          '$watched/$total',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
