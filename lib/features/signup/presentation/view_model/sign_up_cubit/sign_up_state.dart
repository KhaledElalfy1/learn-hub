sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final String message;

  SignUpSuccess(this.message);
}

final class SignUpError extends SignUpState {
  final String message;

  SignUpError(this.message);
}

final class SignUpAgreeChanged extends SignUpState {}

final class SignUpPasswordVisibilityChanged extends SignUpState {}
