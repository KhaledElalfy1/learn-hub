import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'edit_account_state.dart';

class EditAccountCubit extends Cubit<EditAccountState> {
  final ImagePicker _picker = ImagePicker();

  EditAccountCubit() : super(InitialImage());

  Future<void> changeProfileImage(BuildContext c) async {
    emit(ImageLoading());
    try {
      // اختيار الصورة من الجاليري
      final XFile? imageFile = await _picker.pickImage(source: ImageSource.gallery);

      if (imageFile == null) {
        emit(ImageFailure('No image selected.'));
        return;
      }

      // قم بتحويل الصورة إلى ملف
      final File image = File(imageFile.path);

      // هنا يمكنك إضافة المنطق الخاص بك لتحميل الصورة (مثل رفعها إلى السيرفر)
      // ولكننا سنقوم فقط بمحاكاة تحميل الصورة بنجاح

      await Future.delayed(const Duration(seconds: 2)); // محاكاة تأخير في التحميل

      // بعد التحميل بنجاح
      emit(ImageLoadedSuccessfully(image.path));
      ScaffoldMessenger.of(c).showSnackBar(

        const SnackBar(content: Text("Image Loaded Successfully"),backgroundColor: Colors.green,)
      );
    } catch (error) {
      emit(ImageFailure(error.toString()));
    }
  }
}
