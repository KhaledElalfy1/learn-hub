
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/size_manager.dart';
import '../../../../core/managers/style_manager.dart';
import '../pages/my_courses_screen.dart';
import 'custom_progress_bar.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({super.key, required this.index, required this.course});
final int index;
final Course course;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: SizeManager.s20.w,vertical: SizeManager.s24.h),
      decoration: BoxDecoration(
        color: [ColorManager.lightGreen,ColorManager.lightBlue,ColorManager.lightPink][index%3],
        borderRadius: BorderRadius.circular(SizeManager.s20.r),
        boxShadow: [
          BoxShadow(
            color: ColorManager.lighterGrey.withOpacity(0.2),
            blurRadius: 12,
            offset: const Offset(0, 8), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Text(course.title,maxLines:3,overflow: TextOverflow.ellipsis,style: StyleManager.titlePoppins(color: ColorManager.darkBlue,fontSize: SizeManager.s18.sp),)),
          // SizeManager.s32.verticalSpace,
          CustomProgressBar(
            barColor:[
              [ColorManager.green,ColorManager.blue,ColorManager.darkPink][index%3].withOpacity(0.5),
              [ColorManager.green,ColorManager.blue,ColorManager.darkPink][index%3],
            ], width:course.progress* (1.sw-(64.w+((1.sw-64.w)/2)+24.w+7.w)),
          ),
          SizeManager.s8.verticalSpace,

          Text('Completed',style: StyleManager.descriptionPoppins(color: ColorManager.darkBlue,fontSize: SizeManager.s14.sp),),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(course.date,style: StyleManager.titlePoppins(color: ColorManager.darkBlue),),
    Container(
      width: 44.dm,
      height: 44.dm,
      decoration: BoxDecoration(
        color: [ColorManager.green,ColorManager.blue,ColorManager.darkPink][index%3],
        borderRadius: BorderRadius.circular(SizeManager.s20.r),
      ),
      child:const Icon(Icons.play_arrow,color: ColorManager.white,),
    )
  ],
)        ])
    );
  }
}
