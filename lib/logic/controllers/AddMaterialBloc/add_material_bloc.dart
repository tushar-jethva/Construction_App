import 'package:bloc/bloc.dart';
import 'package:construction_mate/data/repository/project_repository.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:meta/meta.dart';

part 'add_material_event.dart';
part 'add_material_state.dart';

class AddMaterialBloc extends Bloc<AddMaterialEvent, AddMaterialState> {
  final ProjectRepository projectRepository;

  AddMaterialBloc({required this.projectRepository})
      : super(AddMaterialState()) {
    on<AddMaterialEvent>((event, emit) async {
      print('comin');
      emit(state.copyWith(isLoading: true, projectValue: ""));
      try {
        final projects = await projectRepository.allProjects();
        projects.insert(0, ProjectModel(name: "--Select Project--", sId: '0'));
        emit(state.copyWith(projects: projects, isLoading: false));
      } catch (e) {}
    });

    on<OnProjectValueChangedEvent>((event, emit) {
      emit(state.copyWith(projectValue: event.projectId));
    });
  }
}
