sealed class UpdateNewImageState {}

final class UpdateNewImageInitial extends UpdateNewImageState {}

final class UpdateNewImageLoading extends UpdateNewImageState {}

final class UpdateNewImageSuccess extends UpdateNewImageState {}

final class UpdateNewImageFailure extends UpdateNewImageState {
  final String eMessage;

  UpdateNewImageFailure({required this.eMessage});
}
