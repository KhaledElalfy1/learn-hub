import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnhub/core/widgets/cached_profile_photo.dart';
import 'package:learnhub/features/profile/presentation/controller/update_new_image_cubit/update_new_image_cubit.dart';
import 'package:learnhub/features/profile/presentation/controller/update_new_image_cubit/update_new_image_state.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              Text(
                FirebaseAuth.instance.currentUser!.displayName!.isNotEmpty
                    ? FirebaseAuth.instance.currentUser!.displayName!
                    : 'Guest',
                style: const TextStyle(
                    fontSize: 23,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 5,
              ),
              const Row(
                children: [
                  Text(
                    'Let\'s learn new things',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
          CachedProfilePhoto(
            hight: 50,
            width: 50,
            radius: 45.r,
          ),
        ],
      ),
    );
  }
}
