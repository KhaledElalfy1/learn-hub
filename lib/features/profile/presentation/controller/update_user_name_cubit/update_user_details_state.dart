sealed class UpdateUserDetailsState {}

final class UpdateUserDetailsInitial extends UpdateUserDetailsState {}

final class UpdateUserNameSuccess extends UpdateUserDetailsState {}

final class UpdateUserNameFailure extends UpdateUserDetailsState {
  final String eMessage;

  UpdateUserNameFailure({required this.eMessage});
}

final class UpdateUserPictureSuccess extends UpdateUserDetailsState {}
final class UpdateUserPictureFailure extends UpdateUserDetailsState {
  final String eMessage;

  UpdateUserPictureFailure({required this.eMessage});
}

final class UpdateUserDetailsLoading extends UpdateUserDetailsState {}
final class UpdateUserDetailsSuccess extends UpdateUserDetailsState {}
final class UpdateUserDetailsFailure extends UpdateUserDetailsState {
  final String eMessage;

  UpdateUserDetailsFailure({required this.eMessage});
}