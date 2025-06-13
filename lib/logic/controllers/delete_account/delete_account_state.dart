part of 'delete_account_bloc.dart';

@freezed
class DeleteAccountState with _$DeleteAccountState {
  const factory DeleteAccountState({
    required RequestState state,
    required String message,
    required String email,
  }) = _DeleteAccountState;
  factory DeleteAccountState.initial() =>
      DeleteAccountState(state: RequestState.empty, message: '', email: '');
}
