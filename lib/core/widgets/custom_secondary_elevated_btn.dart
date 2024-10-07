import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:learnhub/core/managers/color_manager.dart';
import 'package:learnhub/core/managers/size_manager.dart';
import 'package:learnhub/core/managers/style_manager.dart';

class CustomSecondaryElevatedBtn extends StatelessWidget {
  final void Function() onPressed;
  final String buttonTxt;
  final double btnWidth;
  const CustomSecondaryElevatedBtn(
      {super.key,
      required this.onPressed,
      required this.buttonTxt,
      required this.btnWidth});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:
            const WidgetStatePropertyAll<Color>(ColorManager.white),
        overlayColor:
            const WidgetStatePropertyAll<Color>(ColorManager.lightGrey),
        minimumSize:
            WidgetStatePropertyAll<Size>(Size(btnWidth, SizeManager.s64.sp)),
        shape: WidgetStatePropertyAll<OutlinedBorder>(RoundedRectangleBorder(
            side: const BorderSide(color: ColorManager.blue),
            borderRadius:
                BorderRadius.all(Radius.circular(SizeManager.s8.sp)))),
      ),
      child: Text(
        buttonTxt,
        style: StyleManager.descriptionPoppins(color: ColorManager.blue),
      ),
    );
  }
}
