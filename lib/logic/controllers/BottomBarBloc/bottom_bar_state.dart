part of 'bottom_bar_bloc.dart';

@immutable
sealed class BottomBarState {
  final int tabIndex;
  const BottomBarState({required this.tabIndex});
}

class LandingPageInitial extends BottomBarState {
  const LandingPageInitial({required super.tabIndex});
}
