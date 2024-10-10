import 'package:flutter/material.dart';
import 'package:learnhub/core/managers/color_manager.dart';
import 'package:learnhub/core/managers/size_manager.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CourseProgressWidget extends StatelessWidget {
  const CourseProgressWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
                color: ColorManager.lightGrey.withOpacity(.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3))
          ]),
      child: Padding(
        padding: const EdgeInsets.only(top: 32.0, left: 32.0, right: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Learned today",
                  style: TextStyle(
                      fontSize: SizeManager.s12, color: ColorManager.lightGrey),
                ),
                const SizedBox(
                  width: 150,
                ),
                Text(
                  "My courses",
                  style: TextStyle(
                      fontSize: SizeManager.s12, color: ColorManager.blue),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  "46 min",
                  style: TextStyle(
                      fontSize: SizeManager.s20, fontWeight: FontWeight.bold),
                ),
                Text(
                  " / 60min",
                  style: TextStyle(
                      color: ColorManager.lightGrey, fontSize: SizeManager.s12),
                )
              ],
            ),
            LinearPercentIndicator(
              width: MediaQuery.sizeOf(context).width - 100,
              lineHeight: 14.0,
              percent: 46 / 60,
              barRadius: const Radius.circular(20),
              animation: true,
              animationDuration: 5000,
              backgroundColor: Colors.grey,
              progressColor: const Color(0xffFF5106),
            ),
          ],
        ),
      ),
    );
  }
}
