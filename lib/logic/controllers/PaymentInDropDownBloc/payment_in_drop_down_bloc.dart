import 'package:bloc/bloc.dart';
import 'package:construction_mate/data/repository/agency_repository.dart';
import 'package:construction_mate/data/repository/project_repository.dart';
import 'package:construction_mate/data/repository/transaction_repository.dart';
import 'package:construction_mate/logic/models/drop_down_agency_model.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:meta/meta.dart';

part 'payment_in_drop_down_event.dart';
part 'payment_in_drop_down_state.dart';

class PaymentInDropDownBloc
    extends Bloc<PaymentInDropDownEvent, PaymentInDropDownState> {
  final ProjectRepository projectRepository;
  final AgencyRepository agencyRepository;
  final TransactionRepository transactionRepository;
  PaymentInDropDownBloc(
      {required this.projectRepository,
      required this.agencyRepository,
      required this.transactionRepository})
      : super(PaymentInDropDownState()) {
    on<FetchProjectsInEvent>((event, emit) async {
      emit(ProjectsLoadingInState(
          projectDropDownValue: state.projectDropDownValue,
          agencyDropDownValue: state.agencyDropDownValue,
          projects: state.projects,
          agencies: state.agencies));
      try {
        final projects = await projectRepository.allProjects();
        projects.insert(0, ProjectModel(name: "--Select Project--", sId: '0'));
        emit(state.copyWith(projects: projects));
        emit(ProjectsLoadedInState(
            projectDropDownValue: state.projectDropDownValue,
            agencyDropDownValue: state.agencyDropDownValue,
            projects: state.projects,
            agencies: state.agencies));
        add(FetchAgencyInEvent());
      } catch (e) {
        print(e.toString());
      }
    });

    on<FetchAgencyInEvent>((event, emit) async {
      emit(AgenciesLoadingInState(
          projectDropDownValue: state.projectDropDownValue,
          agencyDropDownValue: state.agencyDropDownValue,
          projects: state.projects,
          agencies: state.agencies));
      try {
        final agencies = await agencyRepository.getPaymentInAgency();
        print(agencies);
        agencies.insert(
            0,
            DropDownAgencyModel(
                agencyName: "--Select Agency--", agencyId: '0'));
        emit(state.copyWith(agencies: agencies));
        emit(AgenciesLoadedInState(
            projectDropDownValue: state.projectDropDownValue,
            agencyDropDownValue: state.agencyDropDownValue,
            projects: state.projects,
            agencies: state.agencies));
      } catch (e) {}
    });

    on<AgencyValueInChanged>((event, emit) async {
      emit(state.copyWith(agencyDropDownValue: event.agencyId));
      emit(AgenciesLoadedInState(
          projectDropDownValue: state.projectDropDownValue,
          agencyDropDownValue: state.agencyDropDownValue,
          projects: state.projects,
          agencies: state.agencies));
    });

    on<ProjectValueInChanged>((event, emit) async {
      emit(state.copyWith(projectDropDownValue: event.projectId));
      emit(AgenciesLoadedInState(
          projectDropDownValue: state.projectDropDownValue,
          agencyDropDownValue: state.agencyDropDownValue,
          projects: state.projects,
          agencies: state.agencies));
    });

    on<AddPaymentInTransaction>((event, emit) async {
      try {
        emit(PaymentInAddLoading(
            projectDropDownValue: state.projectDropDownValue,
            agencyDropDownValue: state.agencyDropDownValue,
            projects: state.projects,
            agencies: state.agencies));
        print(state.projectDropDownValue);
        await transactionRepository.addPaymentInTransaction(
            description: event.description,
            agencyId: state.agencyDropDownValue,
            projectId: event.projectValue ?? state.projectDropDownValue,
            amount: event.amount);
        print("amoutn is: ${event.description}");
        emit(PaymentInAddSuccess(
            projectDropDownValue: state.projectDropDownValue,
            agencyDropDownValue: state.agencyDropDownValue,
            projects: state.projects,
            agencies: state.agencies));
      } catch (e) {
        emit(PaymentInAddFailure(
            projectDropDownValue: state.projectDropDownValue,
            agencyDropDownValue: state.agencyDropDownValue,
            projects: state.projects,
            agencies: state.agencies));
      }
    });
  }
}
