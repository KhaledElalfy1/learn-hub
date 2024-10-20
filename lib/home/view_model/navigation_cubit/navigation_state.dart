
sealed class NavigationState {}

final class NavigationInitial extends NavigationState {}

final class NavigationSelected extends NavigationState {
  final int index;

  NavigationSelected(this.index);
}