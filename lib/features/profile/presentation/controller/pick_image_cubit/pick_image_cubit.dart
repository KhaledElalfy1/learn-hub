import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learnhub/features/profile/presentation/controller/pick_image_cubit/pick_image_state.dart';


class PickImageCubit extends Cubit<PickImageState> {
  PickImageCubit() : super(PickImageInitial());
  static PickImageCubit get(context) => BlocProvider.of(context);
  File? image;
  Future<void> _pickImage({required ImageSource source}) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        image = File(pickedFile.path);
        emit(PickImageDone());
      } else {
        debugPrint('No Image is selected');
        emit(PickImageFailure('No Image is selected'));
      }
    } on Exception catch (_) {
      emit(PickImageFailure('No Image is selected'));
    }
  }

  Future<void> pickImageFromGallery() =>
      _pickImage(source: ImageSource.gallery);

  Future<void> pickImageFromCamera() => _pickImage(source: ImageSource.camera);
}
