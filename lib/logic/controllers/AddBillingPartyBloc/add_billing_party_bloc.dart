import 'package:bloc/bloc.dart';
import 'package:construction_mate/data/repository/billing_party_repository.dart';
import 'package:construction_mate/data/repository/project_repository.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:meta/meta.dart';

part 'add_billing_party_event.dart';
part 'add_billing_party_state.dart';

class AddBillingPartyBloc
    extends Bloc<AddBillingPartyEvent, AddBillingPartyState> {
  final ProjectRepository projectRepository;
  final BillingPartyRepository billingPartyRepository;
  AddBillingPartyBloc({required this.projectRepository, required this.billingPartyRepository})
      : super(AddBillingPartyState()) {
    on<LoadProjectsBillingEvent>((event, emit) async {
      try {
        emit(state.copyWith(isLoadingProject: false,projectValue: state.projectValue));
        final projects = await projectRepository.allProjects();
        projects.insert(0, ProjectModel(name: "--Select Project--", sId: '0'));
        emit(state.copyWith(projects: projects, isLoadingProject: true, projectValue: state.projectValue));
      } catch (e) {}
    });
    on<BillingProjectValueChanged>((event, emit) {
      emit(state.copyWith(projectValue: event.projectValue));
    });
    on<AddBillingParty>((event, emit) async{
      try{
          emit(state.copyWith(isAdded: 1));
          billingPartyRepository.addBillingParty(projectId: state.projectValue, partyName: event.partyName, gstNo: event.gstNo, email: event.email, contactNo: event.contactNo, shippingAddress: event.shippingAddress, billingAddress: event.billingAddress);
          emit(state.copyWith(isAdded: 2));
      }
      catch(e){}
    });
  }
}
