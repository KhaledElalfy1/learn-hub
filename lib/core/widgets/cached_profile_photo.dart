import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learnhub/core/managers/asset_manager.dart';
import 'package:learnhub/core/widgets/shimmer_custom_loading.dart';

class CachedProfilePhoto extends StatelessWidget {
  const CachedProfilePhoto({super.key, required this.radius, required this.hight, required this.width});
  final double radius;
  final double hight;
  final double width;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        height:hight ,
        width: width,
        imageUrl: FirebaseAuth.instance.currentUser!.photoURL??'https://firebasestorage.googleapis.com/v0/b/test-e61aa.appspot.com/o/profilePictures%2F1720077983517?alt=media&token=d2f652b0-94c0-4a1a-95e3-138c8f40cba8',
        placeholder: (context, url) => ShimmerCustomLoading(radius: radius),
        errorWidget: (context, url, error) =>
            SvgPicture.asset(SvgAssets.profile),
      ),
    );
  }
}
