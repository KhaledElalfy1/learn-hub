import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnhub/features/profile/presentation/controller/show_chosen_cubit/show_chosen_image_state.dart';


class ShowChosenImageCubit extends Cubit<ShowChosenImageState> {
  ShowChosenImageCubit() : super(ShowChosenImageInitial());
  static ShowChosenImageCubit get(context) => BlocProvider.of(context);
  File? image;
  void viewImage(File? chosenImage) {
    image = chosenImage;
    emit(ShowChosenImageDone());
  }

  void deleteImage() {
    image = null;
    emit(DeleteChosenImageDone());

  }
}
