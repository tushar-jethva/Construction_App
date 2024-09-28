import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'payment_out_other_expense_event.dart';
part 'payment_out_other_expense_state.dart';
part 'payment_out_other_expense_bloc.freezed.dart';

class PaymentOutOtherExpenseBloc extends Bloc<PaymentOutOtherExpenseEvent, PaymentOutOtherExpenseState> {
  PaymentOutOtherExpenseBloc() : super(PaymentOutOtherExpenseState.initial()) {
    on<PaymentOutOtherExpenseEvent>((event, emit) {
    });
  }
}
