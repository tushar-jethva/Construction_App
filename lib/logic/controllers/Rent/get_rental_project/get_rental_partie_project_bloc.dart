import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/usecases/rental_usecase.dart';
import 'package:construction_mate/logic/models/project_partie_model.dart';
import 'package:construction_mate/logic/models/rental/rental_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'get_rental_partie_project_event.dart';
part 'get_rental_partie_project_state.dart';
part 'get_rental_partie_project_bloc.freezed.dart';

@singleton
class GetRentalPartieProjectBloc
    extends Bloc<GetRentalPartieProjectEvent, GetRentalPartieProjectState> {
  GetRentalPartieProjectBloc(this.rentalUsecase)
      : super(GetRentalPartieProjectState.initial()) {
    on<GetRentalPartieProjectEvent>((event, emit) async {
      await event.map(initialize: (_Initialize value) {
        emit(GetRentalPartieProjectState.initial());
      },
      onSearchQueryChanged: (_OnSearchQueryChanged value){
        emit(state.copyWith(
            state: RequestState.empty, searchQuery: value.searchQuery));
      },
       onPartieIndexChanged: (value) {
        emit(state.copyWith(
            state: RequestState.empty, partieIndex: value.index));
      },
       onProductIndexChanged: (value) {
        emit(state.copyWith(
            state: RequestState.empty, productIndex: value.index));
      }, fetchRentalParties: (_FetchRentalParties value) async {
        emit(state.copyWith(state: RequestState.loading));

        final res = await rentalUsecase.getProjectRentalParties(
            projectId: value.projectId);

        res.fold((l) {
          emit(state.copyWith(state: RequestState.error, message: l.message));
        }, (r) {
          emit(state.copyWith(
              state: RequestState.loaded,
              rental: r,
              renalParties: r.data ?? []));
        });
      });
    });
  }

  final RentalUsecase rentalUsecase;
}
