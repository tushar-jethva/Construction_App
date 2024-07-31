import 'package:bloc/bloc.dart';
import 'package:construction_mate/data/repository/transaction_repository.dart';
import 'package:meta/meta.dart';

part 'total_payment_out_event.dart';
part 'total_payment_out_state.dart';

class TotalPaymentOutBloc
    extends Bloc<TotalPaymentOutEvent, TotalPaymentOutState> {
  final TransactionRepository transactionRepository;
  TotalPaymentOutBloc({required this.transactionRepository})
      : super(TotalPaymentOutState()) {
    on<FetchTotalPaymentOut>((event, emit) async {
      try {
        String totalPaymentOut =
            await transactionRepository.getTotalPaymentOut();
        emit(state.copyWith(paymentOut: totalPaymentOut));
      } catch (e) {}
    });
  }
}
