import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/size_manager.dart';
import '../../../../core/managers/style_manager.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Checkbox(value: false, onChanged: (value){}),
            Expanded(
              child: Text('By creating an account you have to agree with our them & condication.',

                style: StyleManager.descriptionPoppins(color: ColorManager.darkGrey,fontSize: 12.sp),),
            ),
          ],
        ),

        SizeManager.s24.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already have an account ? ",style: StyleManager.descriptionPoppins(color: ColorManager.darkGrey),),
            Text("Log in",style: StyleManager.mediumPoppins(color: ColorManager.blue),),
          ],
        ),

      ],
    );
  }
}
