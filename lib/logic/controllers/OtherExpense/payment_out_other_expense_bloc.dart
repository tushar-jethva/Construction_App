import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/usecases/transaction_usecase.dart';
import 'package:construction_mate/utilities/extension/transaction_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'payment_out_other_expense_event.dart';
part 'payment_out_other_expense_state.dart';
part 'payment_out_other_expense_bloc.freezed.dart';

@singleton
class PaymentOutOtherExpenseBloc
    extends Bloc<PaymentOutOtherExpenseEvent, PaymentOutOtherExpenseState> {
  PaymentOutOtherExpenseBloc(this.transactionUsecase)
      : super(PaymentOutOtherExpenseState.initial()) {
    on<PaymentOutOtherExpenseEvent>((event, emit) async {
      await event.map(
        initialize: (_Initialize value) {
          emit(PaymentOutOtherExpenseState.initial());
        },
        onAmountChanged: (_OnAmountChanged value) {
          emit(state.copyWith(state: RequestState.empty, amount: value.amount));
        },
        onTransactionTypeChanged: (_OnTransactionTypeChanged value) {
          emit(state.copyWith(
              state: RequestState.empty,
              transactionType: value.transationType));
        },
        onDescriptionChanged: (_OnDescriptionChanged value) {
          emit(state.copyWith(
              state: RequestState.empty, description: value.description));
        },
        addOtherPaymentOUt: (_AddPaymentOut value) async {
          emit(state.copyWith(state: RequestState.loading));
          final res = await transactionUsecase.addOtherTransaction(
              entryType: state.entryType,
              amount: state.amount,
              description: state.description,
              transactionType: state.transactionType);

          res.fold((l) {
            emit(state.copyWith(state: RequestState.error, message: l.message));
          }, (r) {
            emit(state.copyWith(state: RequestState.loaded, message: r));
          });
        },
      );
    });
  }

  final TransactionUsecase transactionUsecase;
}
