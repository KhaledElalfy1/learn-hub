import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnhub/core/managers/color_manager.dart';
import 'package:learnhub/core/managers/shared_perference_manager.dart';
import 'package:learnhub/core/managers/size_manager.dart';
import 'package:learnhub/core/navigation/routes.dart';
import 'package:learnhub/core/utils/extensions.dart';
import 'package:learnhub/features/login/presentation/cubit/log_out_cubit.dart';
import 'package:learnhub/features/login/presentation/cubit/log_out_state.dart';
import 'package:learnhub/core/widgets/custom_error_widget.dart';

import '../../../login/presentation/pages/login_screen.dart';

const totalTime = 46;

class HomeGetStartedUi extends StatelessWidget {
  const HomeGetStartedUi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            BlocListener<LogOutCubit, LogOutState>(
              listener: (context, state) {
                if (state is LogOutLoading) {
                  showCircularProgressIndicator(context);
                } else if (state is LogOutSuccess) {
                  Navigator.of(context, rootNavigator: true).pop();
                  context.replaceScreen(Routes.login);
                  CustomTextWidget.showMessage(context, "LogOut done Successfully");
                } else if (state is LogOutFailure) {
                  CustomTextWidget.showError(context, "LogOut Failed");
                }
              },
              child: GestureDetector(
                onTap: () async {
                  await BlocProvider.of<LogOutCubit>(context).signOut();
                },
                child: const Icon(
                  Icons.exit_to_app,
                  size: 25,
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                color: ColorManager.lightGrey.withOpacity(.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 32.0, left: 32.0, right: 25.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Learned today",
                      style: TextStyle(fontSize: SizeManager.s20, color: ColorManager.lightGrey),
                    ),
                    Text(
                      "My courses",
                      style: TextStyle(fontSize: SizeManager.s18, color: ColorManager.blue),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "$totalTime min",
                      style: TextStyle(fontSize: SizeManager.s32, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " / 60min",
                      style: TextStyle(color: ColorManager.lightGrey, fontSize: SizeManager.s20),
                    ),
                  ],
                ),
                Row(
                  children: [
                    ColorPicker(totalTime * 5.5, ColorManager.orange, ColorManager.white),
                    ColorPicker((60 - totalTime) * 5.5, ColorManager.grey, ColorManager.grey),
                  ],
                ),
                const SizedBox(height: 130),
                Text(
                  SharedPreferencesManager.getName().toString() ?? "Guest",
                  style: const TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ColorPicker extends StatelessWidget {
  final double width;
  final Color firstColor;
  final Color secondColor;

  const ColorPicker(this.width, this.firstColor, this.secondColor, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        height: 10,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [firstColor, secondColor],
          ),
        ),
      ),
    );
  }
}
