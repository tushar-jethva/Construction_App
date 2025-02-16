import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/repository/billing_party_repository.dart';
import 'package:construction_mate/data/repository/transaction_repository.dart';
import 'package:construction_mate/logic/models/billing_party_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'project_payment_in_event.dart';
part 'project_payment_in_state.dart';
part 'project_payment_in_bloc.freezed.dart';

@singleton
class ProjectPaymentInBloc
    extends Bloc<ProjectPaymentInEvent, ProjectPaymentInState> {
  ProjectPaymentInBloc(this.transactionRepository, this.billingPartyRepository)
      : super(ProjectPaymentInState.initial()) {
    on<ProjectPaymentInEvent>((event, emit) async {
      await event.map(
        initialize: (_Initialize value) {
          emit(ProjectPaymentInState.initial());
        },
        fetchAgencies: (_FetchAgencies value) async {
          emit(state.copyWith(agencyState: RequestState.loading));
          final agencies = await billingPartyRepository.getAllPartiesByProject(
              projectId: value.projectId);
          print(agencies);
          agencies.insert(
              0, BillingPartyModel(name: "--Select Agency--", sId: '0'));
          emit(state.copyWith(
              agencyState: RequestState.loaded, agencies: agencies));
        },
        onPaymentInChanged: (_OnPaymentInChanged value) {
          emit(state.copyWith(
              state: RequestState.empty, paymentIn: value.payment));
        },
        onDescriptionChanged: (_OnDescriptionChanged value) {
          emit(state.copyWith(
              state: RequestState.empty, description: value.des));
        },
        onAgencyDropDownValueChanged: (_OnAgencyDropDownValueChanged value) {
          emit(state.copyWith(
              state: RequestState.empty,
              agencyDropDownValue: value.agencyDropDownValue));
        },
        addPaymentIn: (_AddPaymentIn value) async {
          emit(state.copyWith(state: RequestState.loading));

          await transactionRepository.addPaymentInTransaction(
              date: DateTime.now().toString(),
              agencyId: state.agencyDropDownValue,
              amount: state.paymentIn);

          emit(state.copyWith(state: RequestState.loaded));
        },
      );
    });
  }

  final TransactionRepository transactionRepository;
  final BillingPartyRepository billingPartyRepository;
}
