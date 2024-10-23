
sealed class AddBoughtCourseToFirebaseState {}

final class AddBoughtCourseToFirebaseInitial extends AddBoughtCourseToFirebaseState {}

final class AddBoughtCourseToFirebaseLoading extends AddBoughtCourseToFirebaseState {}

final class AddBoughtCourseToFirebaseSuccess extends AddBoughtCourseToFirebaseState {}

final class AddBoughtCourseToFirebaseFailure extends AddBoughtCourseToFirebaseState {
  final String message;

  AddBoughtCourseToFirebaseFailure(this.message);
}
