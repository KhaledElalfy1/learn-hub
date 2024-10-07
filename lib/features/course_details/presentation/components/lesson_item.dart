import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/size_manager.dart';
import '../../../../core/managers/style_manager.dart';

class LessonItem extends StatelessWidget {
  const LessonItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: SizeManager.s16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '01',
            style:
            StyleManager.titlePoppins(color: ColorManager.lighterGrey),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome to Flutter', style: StyleManager.descriptionPoppins(color: ColorManager.darkBlue)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('6:10 mins',
                      style: StyleManager.mediumPoppins(color: ColorManager.blue)
                  ),
                  const Icon(Icons.check_circle,color: ColorManager.blue)
                ],
              ),
            ],
          ),
          Container(
              width: 44.dm,
              height: 44.dm,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorManager.blue,
              ),
              child: const Icon(Icons.play_arrow,color: ColorManager.white))

        ],
      ),
    );
  }
}
