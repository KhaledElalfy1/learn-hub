sealed class PickImageState {}

final class PickImageInitial extends PickImageState {}

final class PickImageDone extends PickImageState {}

class PickImageFailure extends PickImageState {
  final String message;
  PickImageFailure(this.message);
}
