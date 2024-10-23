import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:learnhub/core/managers/asset_manager.dart';
import 'package:learnhub/core/managers/style_manager.dart';

class CourseDetailsTopArea extends StatelessWidget {
  const CourseDetailsTopArea(
      {super.key, required this.courseName, required this.url});
  final String courseName, url;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: size.height * .3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    CachedNetworkImage(
                      width: size.width,
                      height: size.height * .3,
                      fit: BoxFit.cover,
                      imageUrl: url,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                        value: downloadProgress.progress,
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(ImageAssets.bestseller),
                              ),
                            ),
                            child: Text(
                              'Bestseller',
                              style: StyleManager.descriptionPoppins(
                                  fontSize: 18, fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          courseName,
                          style: StyleManager.mediumPoppins(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 5,
                      child: Image.asset(
                        ImageAssets.illustration,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
