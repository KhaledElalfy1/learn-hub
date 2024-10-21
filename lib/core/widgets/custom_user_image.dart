import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learnhub/core/managers/asset_manager.dart';
import 'package:shimmer/shimmer.dart';

import '../managers/shared_perference_manager.dart';

class CustomUserImage extends StatelessWidget {
  const CustomUserImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 30,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 28,
        child: CachedNetworkImage(
          imageUrl: SharedPreferencesManager.getImage().toString(),
          imageBuilder: (context, imageProvider) => CircleAvatar(
            backgroundImage: imageProvider,
            radius: 30,
          ),
          placeholder: (context, url) => SizedBox(
            width: 200.0,
            height: 100.0,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: const CircleAvatar(
                radius: 30,
              ),
            ),
          ),
          errorWidget: (context, url, error) =>
              SvgPicture.asset(SvgAssets.profile),
          maxHeightDiskCache: 70,
          maxWidthDiskCache: 70,
        ),
      ),
    );
  }
}
