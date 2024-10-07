import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnhub/core/managers/color_manager.dart';
import 'package:learnhub/core/utils/extensions.dart';
import 'package:learnhub/core/widgets/custom_primary_elevated_btn.dart';

import '../managers/size_manager.dart';
import '../managers/style_manager.dart';

class ClockingInDialog extends StatelessWidget {
  const ClockingInDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        width: 1.sw,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300.dm,
              padding: EdgeInsets.symmetric(vertical: SizeManager.s32.h,horizontal: SizeManager.s16.w),
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(SizeManager.s20.r),

              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Clocking in',style: StyleManager.titlePoppins(color: ColorManager.darkBlue),),
                  Text('GOOD JOB!',style: StyleManager.descriptionPoppins(color: ColorManager.darkGrey),),
                  SizeManager.s32.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Learned Today',style: StyleManager.descriptionPoppins(color: ColorManager.darkGrey),),
                          Row(children: [
                            Text('46',style: StyleManager.titlePoppins(color: ColorManager.darkBlue),),
                            Text('min',style: StyleManager.descriptionPoppins(color: ColorManager.darkGrey),),
                          ],)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Learned Today',style: StyleManager.descriptionPoppins(color: ColorManager.darkGrey),),
                          Row(children: [
                            Text('46',style: StyleManager.titlePoppins(color: ColorManager.darkBlue),),
                            Text('min',style: StyleManager.descriptionPoppins(color: ColorManager.darkGrey),),
                          ],)
                        ],
                      ),
                    ],
                  ),

                  SizeManager.s32.verticalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Learned Today',style: StyleManager.descriptionPoppins(color: ColorManager.darkGrey),),
                      Row(children: [
                        Text('46',style: StyleManager.titlePoppins(color: ColorManager.darkBlue),),
                        Text('min',style: StyleManager.descriptionPoppins(color: ColorManager.darkGrey),),
                      ],)
                    ],
                  ),
                  SizeManager.s32.verticalSpace,
                  Center(child: Text('Record of this week',style: StyleManager.descriptionPoppins(color: ColorManager.darkGrey),),),
                  SizeManager.s8.verticalSpace,

                  SizedBox(
                    height: 28.dm,
                    child: ListView.builder(itemBuilder: (BuildContext context, int index) {
                      return
                        StrikeItem(title: '${index+1}',color: index>0?ColorManager.lighterGrey:ColorManager.blue,);
                    },
                      itemCount: 7,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.zero,


                    ),
                  ),
                  SizeManager.s32.verticalSpace,
                  CustomPrimaryElevatedBtn(onPressed: (){}, buttonTxt: 'Share', btnWidth: 0.7.sw,btnHeight: 50.h,)

                ],
              ),
            ),
            SizeManager.s16.verticalSpace,
            GestureDetector(
              onTap: (){
                context.popScreen();
              },
              child: Container(
                width: 44.dm,
                height: 44.dm,
                decoration:  BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorManager.white.withOpacity(0.5),
                    border: Border.all(color: ColorManager.white)

                ),
                child: Icon(Icons.close,color: ColorManager.white,),
              ),
            )

          ],
        ),
      ),
    );
  }
}

class StrikeItem extends StatelessWidget {
  const StrikeItem({
    super.key, required this.title,  this.color=ColorManager.blue,
  });
final String title;
final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28.dm,
      height: 28.dm,
      margin: EdgeInsets.only(right: SizeManager.s12.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Text(title,style: StyleManager.descriptionPoppins(color: ColorManager.white),),
    );
  }
}
