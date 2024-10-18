part of 'visibility_eye_bloc.dart';

@freezed
class VisibilityEyeState with _$VisibilityEyeState{
  const factory VisibilityEyeState({
    required RequestState state,
    required String message,
    required bool isPasswordShow,
    required bool isConfPasswordShow
  }) = _VisibilityEyeState;

  factory VisibilityEyeState.initial() => const VisibilityEyeState(
        state: RequestState.empty,
        message: '',
        isPasswordShow: false,
        isConfPasswordShow: false
      );
}


