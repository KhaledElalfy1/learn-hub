sealed class ChangeAccountNameState {}

final class ChangeAccountNameInitial extends ChangeAccountNameState {}

final class ChangeAccountNameLoading extends ChangeAccountNameState {}

final class ChangeAccountNameSuccess extends ChangeAccountNameState {}

final class ChangeAccountNameFailure extends ChangeAccountNameState {
  final String eMessage;

  ChangeAccountNameFailure({required this.eMessage});
}
