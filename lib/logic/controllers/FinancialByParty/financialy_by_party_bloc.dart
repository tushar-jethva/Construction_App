import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/repository/bills_repository.dart';
import 'package:construction_mate/logic/models/financial_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'financialy_by_party_event.dart';
part 'financialy_by_party_state.dart';
part 'financialy_by_party_bloc.freezed.dart';

class FinancialyByPartyBloc
    extends Bloc<FinancialyByPartyEvent, FinancialyByPartyState> {
  final BillsRepository billsRepository;

  FinancialyByPartyBloc({required this.billsRepository})
      : super(FinancialyByPartyState.initial()) {
    on<FinancialyByPartyEvent>((event, emit) async {
      await event.map(
          fetchFinancialsByParty: (_FetchFinancialByParty value) async {
        final financialModel =
            await billsRepository.getFinancialByPartyId(partyId: value.partyId);
        emit(state.copyWith(
            financialModel: financialModel, state: RequestState.empty));
      });
    });
  }
}
