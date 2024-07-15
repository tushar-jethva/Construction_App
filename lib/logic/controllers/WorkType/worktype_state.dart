part of 'worktype_bloc.dart';

@immutable
sealed class WorktypeState {}

final class WorktypeInitial extends WorktypeState {}

final class WorkTypeLoadedSuccess extends WorktypeState {
  final List<WorkTypeModel> allWorkTypeList;

  WorkTypeLoadedSuccess(this.allWorkTypeList);
}
