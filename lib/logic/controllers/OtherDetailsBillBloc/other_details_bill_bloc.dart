import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/logic/controllers/AddBillBloc/add_bill_bloc.dart';
import 'package:construction_mate/logic/models/Other_Details_Bill_Model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'other_details_bill_event.dart';
part 'other_details_bill_state.dart';
part 'other_details_bill_bloc.freezed.dart';

class OtherDetailsBillBloc
    extends Bloc<OtherDetailsBillEvent, OtherDetailsBillState> {
  OtherDetailsBillBloc() : super(OtherDetailsBillState.initial()) {
    on<OtherDetailsBillEvent>((event, emit) async {
      await event.map(onDeliveryNoteChanged: (value) {
        emit(state.copyWith(deliveryNote: value.value));
      }, onModeOfPaymentChnaged: (value) {
        emit(state.copyWith(modeOfPayment: value.value));
      }, onReferenceNoChanged: (value) {
        emit(state.copyWith(referenceNo: value.value));
      }, onOtherReferencesChanged: (value) {
        emit(state.copyWith(otherReferences: value.value));
      }, onBuyersOrderNoChanged: (value) {
        emit(state.copyWith(buyersOrderNo: value.value));
      }, onDispatchedDocNoChanged: (value) {
        emit(state.copyWith(dispatchDocNo: value.value));
      }, onDispatchedThroughChanged: (value) {
        emit(state.copyWith(dispatchedThrough: value.value));
      }, onDestinationChanged: (value) {
        emit(state.copyWith(destination: value.value));
      }, getOtherModel: (value) {
        final model = OtherDetailsBillModel(
            deliveryNote: state.deliveryNote,
            modeOfPayment: state.modeOfPayment,
            referenceNo: state.referenceNo,
            otherReferences: state.otherReferences,
            buyersOrderNo: state.buyersOrderNo,
            dispatchDocNo: state.dispatchDocNo,
            dispatchedThrough: state.dispatchedThrough,
            destination: state.destination);
        emit(state.copyWith(otherDetailsMode: model));
        
        print(
            "------------------------bloc ${state.otherDetailsMode.deliveryNote}------------------------");
      });
    });
  }
}
