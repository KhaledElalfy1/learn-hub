
sealed class ChangeVisibilityState {}

final class ChangeVisibilityInitial extends ChangeVisibilityState {}

final class ChangeOldPasswordVisibility extends ChangeVisibilityState {}

final class ChangeNewPasswordVisibility extends ChangeVisibilityState {}
