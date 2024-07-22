part of 'transaction_building_bloc.dart';

@immutable
sealed class TransactionBuildingState {}

final class TransactionBuildingLoading extends TransactionBuildingState {}

final class TransactionBuildingSuccess extends TransactionBuildingState {
  final List<TransactionModel> listOfTransactions;
  get projects => listOfTransactions;
  TransactionBuildingSuccess({required this.listOfTransactions});
}

final class TransactionBuildingError extends TransactionBuildingState {
  final String error;

  TransactionBuildingError({required this.error});

}
