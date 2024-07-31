import 'package:bloc/bloc.dart';
import 'package:construction_mate/data/repository/transaction_repository.dart';
import 'package:meta/meta.dart';

part 'payment_total_project_event.dart';
part 'payment_total_project_state.dart';

class PaymentTotalProjectBloc
    extends Bloc<PaymentTotalProjectEvent, PaymentTotalProjectState> {
  final TransactionRepository transactionRepository;

  PaymentTotalProjectBloc({required this.transactionRepository})
      : super(PaymentTotalProjectState()) {
    on<FetchTotalPaymentOutProject>((event, emit) async {
      try {
        String totalPaymentOut = await transactionRepository
            .getTotalPaymentOutProject(projectId: event.projectId);
        emit(state.copyWith(paymentOut: totalPaymentOut));
      } catch (e) {}
    });
  }
}
