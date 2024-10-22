import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnhub/features/login/presentation/cubit/edit_account_cubit.dart';
import '../managers/shared_perference_manager.dart';

class CustomUserImage extends StatelessWidget {
  const CustomUserImage({super.key});

  @override
  Widget build(BuildContext context) {
    String imagePath = SharedPreferencesManager.getImage().toString();
    return BlocBuilder<EditAccountCubit, EditAccountState>(
      builder: (context, state) {
        if (state is ImageLoadedSuccessfully) {
          imagePath = state.imagePath; // استخدام الصورة المحملة
        }
        return CircleAvatar(
          backgroundColor: Colors.white,
          radius: 30,
          child: CircleAvatar(
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
          ),
        );
      },
    );
  }
}
