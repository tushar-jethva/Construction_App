part of 'delete_account_bloc.dart';

@freezed
class DeleteAccountEvent with _$DeleteAccountEvent {
  //Initialize
  const factory DeleteAccountEvent.initialize() = _Initialize;

  //Email Changed
  const factory DeleteAccountEvent.emailChanged({
    required String email,
  }) = _EmailChanged;

  //Delete Account
  const factory DeleteAccountEvent.deleteAccount() = _DeleteAccount;

}
