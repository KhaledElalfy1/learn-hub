import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
          placeholder: (context, url) => const CircularProgressIndicator(), // عرض مؤشر التحميل
          errorWidget: (context, url, error) => const Icon(Icons.error), // عرض رسالة خطأ في حالة فشل تحميل الصورة
          maxHeightDiskCache: 70,
          maxWidthDiskCache: 70,
        ),
      ),
    );
  }
}
