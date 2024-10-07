import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:learnhub/core/managers/color_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomIndicatorwidget extends StatelessWidget {
final PageController pageViewController;
  const CustomIndicatorwidget(
      {super.key, required this.pageViewController});

  @override
  Widget build(BuildContext context) {

    return  Padding(

      padding:  EdgeInsets.only(bottom: 0.05.sh),
      
      child: SmoothPageIndicator(
                  controller: pageViewController,
                  count: 3,
                  effect: ExpandingDotsEffect(
                      dotHeight: 0.01.sh,
                      dotWidth: 0.03.sw,
                      activeDotColor: ColorManager.blue,
                      dotColor: ColorManager.grey),
                ),
    );
  }
}
