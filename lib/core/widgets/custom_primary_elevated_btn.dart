import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:learnhub/core/managers/color_manager.dart';
import 'package:learnhub/core/managers/size_manager.dart';
import 'package:learnhub/core/managers/style_manager.dart';

class CustomPrimaryElevatedBtn extends StatelessWidget {
  final void Function() onPressed;
  final String buttonTxt;
  final double btnWidth;
  final double? btnHeight;
  const CustomPrimaryElevatedBtn(
      {super.key,
      required this.onPressed,
      required this.buttonTxt,
      required this.btnWidth, this.btnHeight,
      });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll<Color>(ColorManager.blue),
        overlayColor:
            const WidgetStatePropertyAll<Color>(ColorManager.lightGrey),
        minimumSize:
            WidgetStatePropertyAll<Size>(Size(btnWidth, btnHeight??SizeManager.s64.sp)),
        shape: WidgetStatePropertyAll<OutlinedBorder>(RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(SizeManager.s8.sp)))),
      ),
      child: Text(
        buttonTxt,
        style: StyleManager.descriptionPoppins(color: ColorManager.white),
      ),
    );
  }
}
