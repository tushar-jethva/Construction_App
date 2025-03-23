import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/usecases/transaction_usecase.dart';
import 'package:construction_mate/logic/controllers/PaymentOutDropDownBloc/payment_out_drop_down_bloc.dart';
import 'package:construction_mate/logic/models/other_transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'payment_out_other_material_and_rent_event.dart';
part 'payment_out_other_material_and_rent_state.dart';
part 'payment_out_other_material_and_rent_bloc.freezed.dart';

@singleton
class PaymentOutOtherMaterialAndRentBloc extends Bloc<
    PaymentOutOtherMaterialAndRentEvent, PaymentOutOtherMaterialAndRentState> {
  PaymentOutOtherMaterialAndRentBloc(
      this.paymentOutDropDownBloc, this.transactionUsecase)
      : super(PaymentOutOtherMaterialAndRentState.initial()) {
    on<PaymentOutOtherMaterialAndRentEvent>((event, emit) async {
      await event.map(started: (_Started value) {
        emit(PaymentOutOtherMaterialAndRentState.initial());
      }, addOtherMaterialAndRent: (_addOtherMaterialAndRent value) async {
        emit(state.copyWith(state: RequestState.loading));

        debugPrint(
            "======= paymentoutother ${paymentOutDropDownBloc.state.projectValue} ========");

        OtherTransactionModel otherTransactionModel = OtherTransactionModel(
            amount: value.amount,
            description: value.description,
            entryType: 'Debit',
            partieId: value.partieId,
            projectId: value.projectId,
            transactionType: value.partyType == PartyType.Material
                ? 'materialSupplier'
                : "equipmentSupplier");

        final res = await transactionUsecase.addOtherTransactionMaterialAndRent(
            otherTransactionModel: otherTransactionModel);

        res.fold((l) {
          emit(state.copyWith(state: RequestState.error, message: l.message));
        }, (r) {
          emit(state.copyWith(state: RequestState.loaded, message: r));
        });
      });
    });
  }

  final PaymentOutDropDownBloc paymentOutDropDownBloc;
  final TransactionUsecase transactionUsecase;
}
