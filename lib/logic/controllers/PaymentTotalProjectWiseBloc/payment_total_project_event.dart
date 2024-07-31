part of 'payment_total_project_bloc.dart';

@immutable
sealed class PaymentTotalProjectEvent {}

class FetchTotalPaymentOutProject extends PaymentTotalProjectEvent{
  final String projectId;
  FetchTotalPaymentOutProject({required this.projectId});
}

