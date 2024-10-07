import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/size_manager.dart';

class CustomProgressBar extends StatelessWidget {
  const CustomProgressBar({
    super.key, required this.barColor, required this.width,
  });
final List<Color> barColor;
final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 6.h,
      decoration: BoxDecoration(
        color: ColorManager.lighterGreyy,
        borderRadius: BorderRadius.circular(SizeManager.s20.r),
      ),
      child: Row(
        children: [
          Container(
            width: width ,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(SizeManager.s20.r)),
                gradient: LinearGradient(
                  colors:
barColor
                  ,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.2, 1.0],
                )
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
