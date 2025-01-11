import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/repository/transaction_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'total_payment_out_event.dart';
part 'total_payment_out_state.dart';
part 'total_payment_out_bloc.freezed.dart';

@singleton
class TotalPaymentOutBloc
    extends Bloc<TotalPaymentOutEvent, TotalPaymentOutState> {
  final TransactionRepository transactionRepository;
  TotalPaymentOutBloc({required this.transactionRepository})
      : super(TotalPaymentOutState.initial()) {
    on<TotalPaymentOutEvent>((event, emit) async {
      await event.map(initialize: (_Initialize value) {
        emit(TotalPaymentOutState.initial());
      }, fetchTotalPayments: (_FetchTotalPayments value) async {
        emit(state.copyWith(state: RequestState.loading));
        final res = await transactionRepository.getTotalPaymentIn();
        await res.fold((l) {
          emit(state.copyWith(state: RequestState.error, message: l.message));
        }, (r) async {
          emit(state.copyWith(paymentIn: r ?? "0"));
          final res = await transactionRepository.getTotalPaymentOut();
          res.fold((l) {
            emit(state.copyWith(state: RequestState.error, message: l.message));
          }, (r) {
            emit(state.copyWith(
                state: RequestState.error, paymentOut: r ?? "0"));
          });
        });
      });
    });
  }
}
