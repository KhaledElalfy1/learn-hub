import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnhub/features/profile/presentation/controller/update_name_cubit/update_name_state.dart';

class UpdateNameCubit extends Cubit<UpdateNameState> {
  UpdateNameCubit() : super(UpdateNameInitial());
  static UpdateNameCubit get(context) => BlocProvider.of(context);
  void updateName() {
    emit(UpdateNameDone());
  }
}
