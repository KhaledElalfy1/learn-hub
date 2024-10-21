import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'reset_pass_state.dart';

class ResetPassCubit extends Cubit<ResetPassState> {
  ResetPassCubit(this.firebaseAuth) : super(ResetPassInitial());
  
  
  final  FirebaseAuth firebaseAuth;
    Future<void> sendResetPasswordEmail(String email) async {
    emit(ResetPassLoading());
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      emit(ResetPassSuccess());
    } catch (e) {
      emit(ResetPassFailure(e.toString()));
    }
  }
}
