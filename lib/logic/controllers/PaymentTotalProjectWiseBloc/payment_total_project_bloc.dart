import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/repository/transaction_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'payment_total_project_event.dart';
part 'payment_total_project_state.dart';

part 'payment_total_project_bloc.freezed.dart';

@singleton
class PaymentTotalProjectBloc
    extends Bloc<PaymentTotalProjectEvent, PaymentTotalProjectState> {
  final TransactionRepository transactionRepository;

  PaymentTotalProjectBloc({required this.transactionRepository})
      : super(PaymentTotalProjectState.initial()) {
    on<PaymentTotalProjectEvent>((event, emit) async {
      await event.map(initialize: (_Initialize value) {
        emit(PaymentTotalProjectState.initial());
      }, fetchAllTotalPayments: (_FetchAllTotalPayments value) async {
        emit(state.copyWith(state: RequestState.loading));

        final res = await transactionRepository.getTotalPaymentOutProject(
            projectId: value.projectId);

        await res.fold((l) {
          emit(state.copyWith(state: RequestState.error, message: l.message));
        }, (r) async {
          emit(state.copyWith(paymentOut: r ?? "0"));
          final res = await transactionRepository.getTotalPaymentInProject(
              projectId: value.projectId);

          res.fold((l) {
            emit(state.copyWith(state: RequestState.error, message: l.message));
          }, (r) {
            emit(state.copyWith(
                state: RequestState.loaded, paymentIn: r ?? "0"));
          });
        });
      });
    });
  }
}
