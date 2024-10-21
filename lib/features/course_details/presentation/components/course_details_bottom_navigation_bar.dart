import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnhub/core/managers/color_manager.dart';
import 'package:learnhub/core/managers/size_manager.dart';
import 'package:learnhub/features/course_details/presentation/components/paypal_checkout_view.dart';
import 'package:learnhub/features/course_details/presentation/widgets/course_details_icon_button.dart';
import 'package:learnhub/features/courses/presentation/data/course_model.dart';

import '../../../../core/widgets/custom_primary_elevated_btn.dart';

class CourseDetailsBottomNavigationBar extends StatelessWidget {
  const CourseDetailsBottomNavigationBar(
      {super.key, required this.courseModel});
  final CourseModel courseModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 90.h,
      padding: EdgeInsets.only(
          right: SizeManager.s16.w,
          left: SizeManager.s16.w,
          bottom: MediaQuery.paddingOf(context).bottom),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(SizeManager.s20.r)),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 15,
              color: ColorManager.lighterGrey.withOpacity(0.502))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CourseDetailsIconButton(onTap: () {}),
          SizeManager.s14.horizontalSpace,
          Expanded(
            child: CustomPrimaryElevatedBtn(
              onPressed: courseModel.price == 'Free'
                  ? () {}
                  : () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              PaypalCheckoutViewFunc(courseModel: courseModel),
                        ),
                      );
                    },
              buttonTxt:
                  courseModel.price == 'Free' ? 'watch' : 'Buy this course',
              btnWidth: 30.w,
              btnHeight: 50.h,
            ),
          ),
        ],
      ),
    );
  }
}
