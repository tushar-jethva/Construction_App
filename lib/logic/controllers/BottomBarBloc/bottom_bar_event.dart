part of 'bottom_bar_bloc.dart';

@immutable
sealed class BottomBarEvent {}

class TabChangeEvent extends BottomBarEvent{
  final int tabIndex;
  TabChangeEvent({required this.tabIndex});
  
}
