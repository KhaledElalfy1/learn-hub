import 'package:flutter/material.dart';
import 'package:learnhub/core/managers/color_manager.dart';

class CustomCircleAvatar extends StatelessWidget {
  final void Function()? iconButtonOnPressed;
  final Color? circleAvatarBackgroundColor;
  final Widget? icon;
  const CustomCircleAvatar(
      {super.key,
      this.iconButtonOnPressed,
      this.circleAvatarBackgroundColor,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: circleAvatarBackgroundColor ?? ColorManager.blue,
      child: IconButton(
          onPressed: iconButtonOnPressed,
          color: ColorManager.white,
          icon: icon ?? const Icon(Icons.play_arrow)),
    );
  }
}
