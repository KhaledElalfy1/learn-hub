import 'package:flutter/material.dart';
import 'package:learnhub/core/managers/color_manager.dart';
import 'package:learnhub/core/managers/size_manager.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CourseProgressWidget extends StatelessWidget {
  const CourseProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Container(
      margin: EdgeInsets.only(left: size.width*.05,top: 30),
      constraints:BoxConstraints.tightFor(width: size.width*.9,height: size.height*.135),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
              color: ColorManager.darkGrey.withOpacity(.3),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(5, 10))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Learned today",
                  style: TextStyle(
                      fontSize: SizeManager.s14,
                      color: ColorManager.lightGrey),
                ),
                Text(
                  "My courses",
                  style: TextStyle(
                      fontSize: SizeManager.s14, color: ColorManager.blue),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // الصف الثاني مع المحاذاة للبداية
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "46 min",
                  style: TextStyle(
                      fontSize: SizeManager.s20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  " / 60min",
                  style: TextStyle(
                      color: ColorManager.lightGrey,
                      fontSize: SizeManager.s12),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // الصف الثالث: LinearPercentIndicator مع تأثير الظل للألوان
            LinearPercentIndicator(
              width: MediaQuery.sizeOf(context).width - 80,
              lineHeight: 10.0,
              percent: 51 / 60,
              barRadius: const Radius.circular(20),
              animation: true,
              animationDuration: 5000,
              backgroundColor: Colors.grey[300],
              progressColor: const Color(0xffFF5106),
              curve: Curves.easeInOut,
              widgetIndicator: const Icon(
                Icons.circle,
                size: 14,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
