part of 'reset_pass_cubit.dart';

@immutable
sealed class ResetPassState {}

final class ResetPassInitial extends ResetPassState {}

class ResetPassLoading extends ResetPassState {}

class ResetPassSuccess extends ResetPassState {}

class ResetPassFailure extends ResetPassState {
  final String errorMessage;

  ResetPassFailure(this.errorMessage);
}