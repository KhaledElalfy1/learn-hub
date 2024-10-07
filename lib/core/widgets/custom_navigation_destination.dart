import 'package:flutter/material.dart';
import 'package:learnhub/core/managers/color_manager.dart';

class CustomNavigationDestination extends StatelessWidget {
  final IconData disabledIcon;
  final IconData selectedIcon;
  final String label;
  const CustomNavigationDestination(
      {super.key,
      required this.disabledIcon,
      required this.selectedIcon,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: Icon(disabledIcon),
      selectedIcon: Icon(selectedIcon, color: ColorManager.blue),
      label: label,
    );
  }
}
