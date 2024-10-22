import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnhub/features/profile/presentation/controller/update_user_name_cubit/update_user_details_state.dart';

class UpdateUserDetailsCubit extends Cubit<UpdateUserDetailsState> {
  UpdateUserDetailsCubit() : super(UpdateUserDetailsInitial());
  static UpdateUserDetailsCubit get(context) => BlocProvider.of(context);
  TextEditingController userNameController = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey();
  File? userImage;
  late String downloadUrl;
  @override
  Future<void> close() {
    userNameController.dispose();
    return super.close();
  }

  void updateUserDetails() async {
    emit(
      UpdateUserDetailsLoading(),
    );
    try {
      await updateUserPicture();
      await updateUserName();
      emit(UpdateUserDetailsSuccess());
    } catch (e) {
      emit(
        UpdateUserDetailsFailure(
          eMessage: 'Failed to update details: $e',
        ),
      );
    }
  }

  Future<void> updateUserPicture() async {
    if (userImage == null) return;

    try {
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final Reference storageRef =
          FirebaseStorage.instance.ref().child('profilePictures/$fileName');

      final UploadTask uploadTask = storageRef.putFile(userImage!);

      final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => {});
      downloadUrl = await taskSnapshot.ref.getDownloadURL();

      debugPrint('Upload successful! Download URL: $downloadUrl');
      await FirebaseAuth.instance.currentUser!.updatePhotoURL(downloadUrl);
      emit(UpdateUserPictureSuccess());
    } catch (e) {
      debugPrint('Error uploading image: $e');
      emit(
        UpdateUserPictureFailure(
          eMessage: 'Error uploading image: $e',
        ),
      );
    }
  }

  Future<void> updateUserName() async {
    try {
      await FirebaseAuth.instance.currentUser!
          .updateDisplayName(userNameController.text);
      emit(UpdateUserNameSuccess());
    } on Exception catch (e) {
      emit(
        UpdateUserNameFailure(
          eMessage: 'Filed to update user name: $e',
        ),
      );
    }
  }

  String? validator(String? value) {
    if (value!.isEmpty) {
      return 'Filed is Required';
    }
    return null;
  }
}
