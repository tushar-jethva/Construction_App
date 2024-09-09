import 'package:bloc/bloc.dart';
import 'package:construction_mate/logic/models/bill_item_model.dart';
import 'package:meta/meta.dart';

part 'add_bill_event.dart';
part 'add_bill_state.dart';

class AddBillBloc extends Bloc<AddBillEvent, AddBillState> {
  AddBillBloc() : super(AddBillState(date: DateTime.now())) {
    on<BillItemAddedEvent>((event, emit) {
      List<BillItemModel> listOfBillItems = List.from(state.billItems)
        ..add(event.billItem);
      emit(state.copyWith(billItems: listOfBillItems));
    });

    on<BillSGSTChangedEvent>((event, emit) {
      emit(state.copyWith(sgst: event.sgst));
    });

    on<BillCGSTChangedEvent>((event, emit) {
      emit(state.copyWith(cgst: event.cgst));
    });

    on<BillTDSChangedEvent>((event, emit) {
      emit(state.copyWith(tds: event.tds));
    });
    on<BillDateChangedEvent>((event, emit) {
      emit(state.copyWith(date: event.dateTime));
    });
    
  }
}
