import 'package:bloc/bloc.dart';
import 'package:construction_mate/data/repository/project_repository.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:meta/meta.dart';

part 'add_billing_party_event.dart';
part 'add_billing_party_state.dart';

class AddBillingPartyBloc
    extends Bloc<AddBillingPartyEvent, AddBillingPartyState> {
  final ProjectRepository projectRepository;
  AddBillingPartyBloc({required this.projectRepository})
      : super(AddBillingPartyState()) {
    on<LoadProjectsBillingEvent>((event, emit) async {
      try {
        emit(state.copyWith(isLoadingProject: false));
        final projects = await projectRepository.allProjects();
        projects.insert(0, ProjectModel(name: "--Select Project--", sId: '0'));
        emit(state.copyWith(projects: projects, isLoadingProject: true));
      } catch (e) {}
    });
  }
}
