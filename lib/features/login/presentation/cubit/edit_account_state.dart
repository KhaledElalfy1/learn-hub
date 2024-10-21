part of 'edit_account_cubit.dart';
abstract class EditAccountState {}

class InitialImage extends EditAccountState {}

class ImageLoading extends EditAccountState {}

class ImageLoadedSuccessfully extends EditAccountState {
  final String imagePath; // لإضافة خاصية المسار

  ImageLoadedSuccessfully(this.imagePath); // استلام المسار في المنشئ
}

class ImageFailure extends EditAccountState {
  final String error; // لإضافة خاصية الخطأ

  ImageFailure(this.error); // استلام رسالة الخطأ
}
