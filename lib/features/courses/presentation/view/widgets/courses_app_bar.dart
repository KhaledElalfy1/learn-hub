import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/widgets/custom_user_image.dart';

class CoursesAppBar extends StatelessWidget {
  const CoursesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Course',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        CustomUserImage()
      ],
    );
  }
}
