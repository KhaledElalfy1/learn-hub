abstract class LoginState {}

class InitialLogin extends LoginState {}

class LoadingLogin extends LoginState{}

class SuccessLogin extends LoginState{}

class FailureLogin extends LoginState{
  final String failureMessage;
  FailureLogin({required this.failureMessage});
}