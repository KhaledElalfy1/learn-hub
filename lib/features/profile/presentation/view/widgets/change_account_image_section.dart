import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnhub/features/profile/presentation/controller/pick_image_cubit/pick_image_cubit.dart';
import 'package:learnhub/features/profile/presentation/controller/update_new_image_cubit/update_new_image_cubit.dart';
import 'package:learnhub/features/profile/presentation/view/widgets/bottom_sheet_body.dart';
import 'package:learnhub/features/profile/presentation/view/widgets/options_row.dart';
class ChangeAccountImageSection extends StatelessWidget {
  const ChangeAccountImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return OptionSection(
      iconPath: Icons.camera_alt,
      title: 'Change Image',
      onTap: () {
        showModalBottomSheet(
          sheetAnimationStyle: AnimationStyle(
            duration: const Duration(
              milliseconds: 600,
            ),
          ),
          context: context,
          builder: (BuildContext context) {
            return BlocProvider(
              create: (context) => PickImageCubit(),
              child: const BottomSheetBody(),
            );
          },
        ).then(
          (value) {
            if (value != null) {
              UpdateNewImageCubit.get(context)
                  .updateUserPicture(userImage: value);
            }
          },
        );
      },
    );
  }
}
