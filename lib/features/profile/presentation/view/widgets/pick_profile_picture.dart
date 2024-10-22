import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learnhub/core/managers/asset_manager.dart';
import 'package:learnhub/features/profile/presentation/controller/show_chosen_cubit/show_chosen_image_cubit.dart';
import 'package:learnhub/features/profile/presentation/controller/show_chosen_cubit/show_chosen_image_state.dart';
class PickUserProfilePicture extends StatelessWidget {
  const PickUserProfilePicture({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        BlocBuilder<ShowChosenImageCubit, ShowChosenImageState>(
          builder: (context, state) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: ShowChosenImageCubit.get(context).image == null
                  ? SvgPicture.asset(SvgAssets.profile)
                  : Image.file(
                      ShowChosenImageCubit.get(context).image!,
                      height: 200,
                      width: 200,
                    ),
            );
          },
        ),
        Positioned(
          bottom: -5,
          right: 0,
          child: IconButton(
            onPressed: onPressed,
            icon: CircleAvatar(
              minRadius: 18.r,
              backgroundColor:const Color(0xffF8C8DC),
              child:const Icon(Icons.edit, color: Colors.white,size: 18,),
            ),
          ),
        ),
      ],
    );
  }
}
