import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnhub/core/managers/color_manager.dart';
import 'package:learnhub/core/managers/size_manager.dart';
import 'package:learnhub/core/widgets/custom_circle_avatar.dart';
import 'package:learnhub/core/widgets/custom_navigation_destination.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: SizeManager.s8.sp),
      child: NavigationBar(
          indicatorColor: Colors.transparent,
          selectedIndex: index,
          onDestinationSelected: (iconIndex) => setState(() {
                index = iconIndex;
              }),
          height: SizeManager.s64.sp,
          backgroundColor: ColorManager.white,
          destinations: const [
            CustomNavigationDestination(
                disabledIcon: Icons.home_outlined,
                selectedIcon: Icons.home,
                label: 'Home'),

            CustomNavigationDestination(
                disabledIcon: Icons.book_outlined,
                selectedIcon: Icons.book,
                label: 'Course'),

            NavigationDestination(
                icon: CustomCircleAvatar(
                  icon: Icon(
                    Icons.search_outlined,
                    color: ColorManager.blue,
                  ),
                  circleAvatarBackgroundColor: ColorManager.grey,
                ),
                selectedIcon: CustomCircleAvatar(
                  icon: Icon(
                    Icons.search,
                    color: ColorManager.grey,
                  ),
                  circleAvatarBackgroundColor: ColorManager.blue,
                ),
                label: 'Search'),

            CustomNavigationDestination(
                disabledIcon: Icons.message_outlined,
                selectedIcon: Icons.message,
                label: 'Message'),
                
            CustomNavigationDestination(
                disabledIcon: Icons.person_outlined,
                selectedIcon: Icons.person,
                label: 'Account')
          ]),
    );
  }
}
