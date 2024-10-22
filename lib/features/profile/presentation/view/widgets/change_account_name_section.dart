import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnhub/features/profile/presentation/controller/change_account_name_cubit/change_account_name_cubit.dart';
import 'package:learnhub/features/profile/presentation/controller/update_name_cubit/update_name_cubit.dart';
import 'package:learnhub/features/profile/presentation/view/widgets/change_name_dialog.dart';
import 'package:learnhub/features/profile/presentation/view/widgets/options_row.dart';

class ChangeAccountNameSection extends StatelessWidget {
  const ChangeAccountNameSection({super.key});

  @override
  Widget build(BuildContext context) {
    return OptionSection(
      iconPath: Icons.person,
      title: 'change Name',
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => BlocProvider(
            create: (context) => ChangeAccountNameCubit(),
            child: const ChangeNameDialog(),
          ),
        ).then((value) {
          if (value != null) {
            UpdateNameCubit.get(context).updateName();
          }
        });
      },
    );
  }
}
