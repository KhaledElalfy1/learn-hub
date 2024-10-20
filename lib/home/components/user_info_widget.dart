import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnhub/core/managers/shared_perference_manager.dart';
import 'package:learnhub/features/login/presentation/cubit/login_state.dart';

import '../../core/widgets/custom_user_image.dart';
import '../../features/login/presentation/cubit/login_cubit.dart';


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
              SizedBox(height: 5,),
              Text(
                'Hi ,${SharedPreferencesManager.getName()}',
                style: const TextStyle(
                    fontSize: 23,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const Row(
                children: [
                  Text(
                    'Let\'s learn new things',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,),
                  ),
                ],
              )
            ],
          ),
          const CustomUserImage()
        ],
      ),
    );
  }
}
