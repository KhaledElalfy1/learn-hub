import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconButton extends StatelessWidget {
  final String svgAssets;
  final void Function()? onTap;
  const CustomIconButton({
    super.key, required this.svgAssets, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: SvgPicture.asset(svgAssets));
  }
}