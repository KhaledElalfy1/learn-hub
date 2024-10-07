import 'package:flutter/material.dart';
import 'package:learnhub/core/managers/color_manager.dart';

class CourseChosenButton extends StatelessWidget {
  const CourseChosenButton({super.key, required this.title, required this.isSelected, required this.onPressed});
  final String title;
  final bool isSelected;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
            isSelected ? ColorManager.blue : ColorManager.white),
        foregroundColor: WidgetStateProperty.all(
            isSelected ? ColorManager.white : ColorManager.lightGrey),
      ),
      onPressed: onPressed,
      child:  Text(title),
    );
  }
}
