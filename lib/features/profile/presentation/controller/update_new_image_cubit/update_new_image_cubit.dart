import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnhub/features/profile/presentation/controller/update_new_image_cubit/update_new_image_state.dart';

class UpdateNewImageCubit extends Cubit<UpdateNewImageState> {
  UpdateNewImageCubit() : super(UpdateNewImageInitial());
  static UpdateNewImageCubit get(context) => BlocProvider.of(context);
  
  Future<void> updateUserPicture({required File? userImage}) async {
    emit(UpdateNewImageLoading());
    if (userImage == null) return;

    try {
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final Reference storageRef =
          FirebaseStorage.instance.ref().child('profilePictures/$fileName');

      final UploadTask uploadTask = storageRef.putFile(userImage);

      final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => {});
     final String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      debugPrint('Upload successful! Download URL: $downloadUrl');
      await FirebaseAuth.instance.currentUser!.updatePhotoURL(downloadUrl);
      emit(UpdateNewImageSuccess());
    } catch (e) {
      debugPrint('Error uploading image: $e');
      emit(
        UpdateNewImageFailure(
          eMessage: 'Error uploading image: $e',
        ),
      );
    }
  }
}
