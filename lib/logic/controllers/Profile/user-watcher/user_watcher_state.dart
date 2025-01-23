part of 'user_watcher_bloc.dart';

@freezed
class UserWatcherState with _$UserWatcherState {
  const factory UserWatcherState({
    required RequestState state,
    required String message,
    required ProfileModel? profile,
  }) = _UserWatcherState;
  factory UserWatcherState.initial() => const UserWatcherState(
      state: RequestState.empty, message: "", profile: null);
}
