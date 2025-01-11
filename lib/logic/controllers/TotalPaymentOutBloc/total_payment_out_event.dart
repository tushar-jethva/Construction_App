part of 'total_payment_out_bloc.dart';

@freezed
class TotalPaymentOutEvent with _$TotalPaymentOutEvent {
  //Initialize
  const factory TotalPaymentOutEvent.initialize() = _Initialize;
  
  //Fetch totals
  const factory TotalPaymentOutEvent.fetchTotalPayments() = _FetchTotalPayments;

}

