import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:learnhub/core/widgets/cached_profile_photo.dart';
import 'package:learnhub/core/widgets/shimmer_custom_loading.dart';
import 'package:learnhub/features/profile/presentation/controller/update_name_cubit/update_name_cubit.dart';
import 'package:learnhub/features/profile/presentation/controller/update_name_cubit/update_name_state.dart';
import 'package:learnhub/features/profile/presentation/controller/update_new_image_cubit/update_new_image_cubit.dart';
import 'package:learnhub/features/profile/presentation/controller/update_new_image_cubit/update_new_image_state.dart';
import 'package:learnhub/features/profile/presentation/view/widgets/change_account_image_section.dart';
import 'package:learnhub/features/profile/presentation/view/widgets/change_account_name_section.dart';
import 'package:learnhub/features/profile/presentation/view/widgets/change_password_section.dart';
import 'package:learnhub/features/profile/presentation/view/widgets/sign_out_section.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        children: [
          Gap(20.h),
          const Text(
            'Profile',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
          Gap(25.h),
          BlocBuilder<UpdateNewImageCubit, UpdateNewImageState>(
            builder: (context, state) {
              return ClipOval(
                child: state is UpdateNewImageLoading
                    ? const ShimmerCustomLoading(radius: 45)
                    : CachedProfilePhoto(
                        hight: 100,
                        width: 100,
                        radius: 45.r,
                      ),
              );
            },
          ),
          Gap(25.h),
          BlocBuilder<UpdateNameCubit, UpdateNameState>(
            builder: (context, state) {
              return Text(
                FirebaseAuth.instance.currentUser!.displayName!.isNotEmpty
                    ? FirebaseAuth.instance.currentUser!.displayName!
                    : 'Guest',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              );
            },
          ),
          Gap(25.h),
          Gap(25.h),
          Gap(25.h),
          const Text('Account',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              )),
          Gap(5.h),
          const ChangeAccountNameSection(),
          Gap(25.h),
          const ChangePasswordSection(),
          Gap(25.h),
          const ChangeAccountImageSection(),
          Gap(25.h),
          const Divider(
            thickness: 1.5,
          ),
          const SignOutSection()
        ],
      ),
    );
  }
}
