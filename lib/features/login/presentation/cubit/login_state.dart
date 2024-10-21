abstract class LoginState {}

class InitialLogin extends LoginState {}

class LoadingLogin extends LoginState{}

class SuccessLogin extends LoginState{}

class FailureLogin extends LoginState{
  final String failureMessage;
  FailureLogin({required this.failureMessage});
}

// class ImageLoading extends LoginState{}
// class ImageSuccessLoaded extends LoginState {}
// class ImageFailure extends LoginState {
//   final String failureMessage;
//   ImageFailure({required this.failureMessage});
// }

class NameUpdated extends LoginState{
  final String newName;
  NameUpdated({required this.newName});
}

