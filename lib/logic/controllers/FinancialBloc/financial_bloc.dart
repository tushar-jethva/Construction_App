import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/repository/bills_repository.dart';
import 'package:construction_mate/logic/models/financial_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'financial_event.dart';
part 'financial_state.dart';
part 'financial_bloc.freezed.dart';

class FinancialBloc extends Bloc<FinancialEvent, FinancialState> {
  final BillsRepository billsRepository;
  FinancialBloc({required this.billsRepository})
      : super(FinancialState.initial()) {
    on<FinancialEvent>((event, emit) async {
      await event.map(fetchFinancials: (_FetchFinancials value) async {
        final financialModel = await billsRepository.getFinancial();
        emit(state.copyWith(
            financialModel: financialModel, state: RequestState.empty));
      });
    });
  }
}
