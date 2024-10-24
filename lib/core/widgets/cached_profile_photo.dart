import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learnhub/core/managers/asset_manager.dart';
import 'package:learnhub/core/widgets/shimmer_custom_loading.dart';

class CachedProfilePhoto extends StatelessWidget {
  const CachedProfilePhoto(
      {super.key,
      required this.radius,
      required this.hight,
      required this.width,
      this.photoUrl});
  final double radius;
  final double hight;
  final double width;
  final String? photoUrl;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        height: hight,
        width: width,
        imageUrl: photoUrl ?? FirebaseAuth.instance.currentUser!.photoURL!,
        placeholder: (context, url) => ShimmerCustomLoading(radius: radius),
        errorWidget: (context, url, error) =>
            SvgPicture.asset(SvgAssets.profile),
      ),
    );
  }
}
