import 'package:flutter/material.dart';

import '../managers/color_manager.dart';
import '../managers/style_manager.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final void Function() onTap;
  const CustomTextButton({
    super.key, required this.text,required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: StyleManager.descriptionPoppins(color: ColorManager.darkGrey),
      ),
    );
  }
}
