// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'package:learnhub/core/managers/theme_manager.dart';
// import 'package:learnhub/core/navigation/routes.dart';

// import '../navigation/app_route.dart';

// class LearnHubApp extends StatelessWidget {
//   const LearnHubApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//         designSize: const Size(375, 812),
//         minTextAdapt: true,
//         splitScreenMode: true,
//         builder: (_, child) {
//           return MaterialApp(
//             title: 'Learn Hub',
//             debugShowCheckedModeBanner: false,
//             theme: ThemeManager.lightMode(),
//             darkTheme: ThemeManager.darkMode(),
//             onGenerateRoute: (routeSettings) =>
//                 AppRoute.getRoute(routeSettings),

//             initialRoute: Routes.register,

//           );
//         });
//   }
// }
