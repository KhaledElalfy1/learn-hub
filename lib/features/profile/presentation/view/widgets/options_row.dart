import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gap/gap.dart';

class OptionSection extends StatelessWidget {
  const OptionSection({super.key, required this.iconPath, required this.title, required this.onTap});
  final IconData iconPath;
  final String  title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(iconPath),
          Gap(10.w),
          Text(
            title,
            style:const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}
