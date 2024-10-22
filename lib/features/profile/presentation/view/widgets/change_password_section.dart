import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnhub/features/profile/presentation/controller/change_password_cubit/change_password_cubit.dart';
import 'package:learnhub/features/profile/presentation/controller/change_visibility_cubit/change_visibility_cubit.dart';
import 'package:learnhub/features/profile/presentation/view/widgets/change_password_dialog.dart';
import 'package:learnhub/features/profile/presentation/view/widgets/options_row.dart';

class ChangePasswordSection extends StatelessWidget {
  const ChangePasswordSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OptionSection(
      iconPath: Icons.key,
      title: 'Change Password',
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ChangePasswordCubit(),
              ),
              BlocProvider(
                create: (context) => ChangeVisibilityCubit(),
              )
            ],
            child: const ChangePasswordDialog(),
          ),
        );
      },
    );
  }
}
