import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/usecases/profile_usecase.dart';
import 'package:construction_mate/logic/models/profile_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'user_watcher_event.dart';
part 'user_watcher_state.dart';
part 'user_watcher_bloc.freezed.dart';

@singleton
class UserWatcherBloc extends Bloc<UserWatcherEvent, UserWatcherState> {
  UserWatcherBloc(this.profileUsecase) : super(UserWatcherState.initial()) {
    on<UserWatcherEvent>((event, emit) async {
      await event.map(initialize: (_Initialize value) {
        emit(UserWatcherState.initial());
      }, fetchProfile: (_FetchProfile value) async {
        emit(state.copyWith(state: RequestState.loading));

        final res = await profileUsecase.getProfile();
        res.fold((l) {
          emit(state.copyWith(state: RequestState.error, message: l.message));
        }, (r) {
          emit(state.copyWith(state: RequestState.loaded, profile: r));
        });
      });
    });
  }

  final ProfileUsecase profileUsecase;
}
