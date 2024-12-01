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
        final totalPaymentOut =
            await transactionRepository.getTotalPaymentOut();
        print("------------------------- pay $totalPaymentOut ---------------");
        final totalPaymentIn =
            await transactionRepository.getTotalPaymentIn();
        emit(state.copyWith(
            paymentOut: totalPaymentOut ?? "0.00", paymentIn: totalPaymentIn ?? "0.00"));
      } catch (e) {}
    });
  }
}
