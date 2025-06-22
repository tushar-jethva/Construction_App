part of 'delete_account_bloc.dart';

@freezed
class DeleteAccountEvent with _$DeleteAccountEvent {
  //Initialize
  const factory DeleteAccountEvent.started() = _Initialize;

  //Email Changed
  const factory DeleteAccountEvent.emailOnChanged({required String email}) =
      _EmailOnChanged;

  //Delete Account
  const factory DeleteAccountEvent.deleteAccount() = _DeleteAccount;

  //Delete account mobile
  const factory DeleteAccountEvent.deleteAccountMobile() = _DeleteAccountMobile;
}
