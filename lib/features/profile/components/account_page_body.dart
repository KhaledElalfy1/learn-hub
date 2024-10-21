import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learnhub/features/login/presentation/cubit/log_out_cubit.dart';
import 'package:learnhub/features/profile/components/account_option_detail.dart';

import '../../../core/managers/asset_manager.dart';
import '../../../core/managers/shared_perference_manager.dart';
import '../../login/presentation/cubit/edit_account_cubit.dart';
import '../../login/presentation/cubit/login_cubit.dart';
import '../../login/presentation/cubit/login_state.dart';

class AccountPageBody extends StatelessWidget {
  const AccountPageBody({super.key});

  // static String name = SharedPreferencesManager.getName().toString();
  // static String image = SharedPreferencesManager.getImage().toString();
  @override
  Widget build(BuildContext context) {
    String imagePath = SharedPreferencesManager.getImage().toString();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                  BlocConsumer<EditAccountCubit, EditAccountState>(
                listener: (context, state) {
                  if (state is ImageLoading) {
                    // عرض مؤشر التحميل
                    showDialog(
                      context: context,
                      builder: (context) => const Center(child: CircularProgressIndicator(color: Colors.blue,)),
                    );
                  } else if (state is ImageLoadedSuccessfully) {
                    imagePath = state.imagePath;
                    // أغلق مربع التحميل
                    Navigator.of(context).pop(); // إغلاق الديالوج

                    // قم بتحديث واجهتك بالصورة الجديدة
                    // هنا يمكنك استدعاء دالة لتحديث واجهتك أو استخدام setState
                  } else if (state is ImageFailure) {
                    // أغلق مربع التحميل
                    Navigator.of(context).pop(); // إغلاق الديالوج

                    // اعرض رسالة الخطأ
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
                  }
                },
                builder: (context, state) {
                  return  CircleAvatar(
                    backgroundColor: const Color(0xff2296F3),
                    radius: 48,
                    child: ClipOval(
                      child: imagePath.isNotEmpty
                          ? Image.file(
                        File(imagePath),
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.network(imagePath);
                        },
                      )
                          : const Icon(Icons.camera_alt, size: 90), // صورة افتراضية
                    ),
                  );
                },
                ),

                  Positioned(
                      right: 0,
                      top: 3,
                      child: GestureDetector(
                        onTap: () {
                          BlocProvider.of<EditAccountCubit>(context)
                              .changeProfileImage(context);
                        },
                        child: const CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 15,
                          child: Icon(
                            size: 20,
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    String name = SharedPreferencesManager.getName()
                        .toString(); // الاسم الافتراضي
                    if (state is NameUpdated) {
                      name =
                          state.newName; // استخدام الاسم الجديد إذا تم تحديثه
                    }
                    return Text(
                      name,
                      style: const TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const AccountOptionDetail(),
        ],
      ),
    );
  }
}
