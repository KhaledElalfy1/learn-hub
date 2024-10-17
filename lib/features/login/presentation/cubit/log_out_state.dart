abstract class LogOutState {}

class LogOutInitial extends LogOutState {}

class LogOutLoading extends LogOutState {}

class LogOutSuccess extends LogOutState {}

class LogOutFailure extends LogOutState {
  final String failureMessage;

  LogOutFailure({required this.failureMessage});

}




