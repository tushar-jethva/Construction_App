part of 'payment_out_drop_down_bloc.dart';

@immutable
sealed class PaymentOutDropDownEvent {}

class FetchProjectsEvent extends PaymentOutDropDownEvent {}

class FetchBuildingsEvent extends PaymentOutDropDownEvent {
  final String projectId;

  FetchBuildingsEvent(this.projectId);

}

class FetchAgenciesEvent2 extends PaymentOutDropDownEvent {
  final String buildingId;

  FetchAgenciesEvent2(this.buildingId);
}

