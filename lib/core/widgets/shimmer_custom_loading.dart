import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';



class ShimmerCustomLoading extends StatelessWidget {
  const ShimmerCustomLoading({super.key, required this.radius});
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: CircleAvatar(
        radius: radius,
      ),
    );
  }
}
