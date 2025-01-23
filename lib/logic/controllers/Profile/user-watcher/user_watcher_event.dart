part of 'user_watcher_bloc.dart';

@freezed
class UserWatcherEvent with _$UserWatcherEvent {
  //Initialize
  const factory UserWatcherEvent.initialize() = _Initialize;

  //Fetch profile
  const factory UserWatcherEvent.fetchProfile() = _FetchProfile;
}
