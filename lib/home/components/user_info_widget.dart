import 'package:flutter/material.dart';
import 'package:learnhub/core/managers/shared_perference_manager.dart';

import '../../core/widgets/custom_user_image.dart';


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
              const SizedBox(height: 5,),
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  String name = SharedPreferencesManager.getName().toString();  // الاسم الافتراضي
                  if (state is NameUpdated) {
                    name = state.newName;  // استخدام الاسم الجديد إذا تم تحديثه
                  }
                  return Text(
                    'Hi $name',
                    style: const TextStyle(
                        fontSize: 23,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  );
                },
             const SizedBox(height: 5,),
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
