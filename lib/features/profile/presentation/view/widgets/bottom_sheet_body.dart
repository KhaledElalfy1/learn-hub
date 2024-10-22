import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnhub/features/profile/presentation/controller/pick_image_cubit/pick_image_state.dart';
import '../../controller/pick_image_cubit/pick_image_cubit.dart';

class BottomSheetBody extends StatelessWidget {
  const BottomSheetBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<PickImageCubit, PickImageState>(
      listener: (context, state) {
        if (state is PickImageDone) {
          Navigator.pop(context, PickImageCubit.get(context).image);
        }
      },
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                PickImageCubit.get(context).pickImageFromGallery();
              },
              icon: const Icon(
                Icons.image_outlined,
                size: 40,
              ),
            ),
            IconButton(
              onPressed: PickImageCubit.get(context).pickImageFromCamera,
              icon: const Icon(
                Icons.camera_alt_outlined,
                size: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}
