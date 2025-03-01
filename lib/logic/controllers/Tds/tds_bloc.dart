import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/usecases/profile_usecase.dart';
import 'package:construction_mate/logic/models/others_transaction_data_model.dart';
import 'package:construction_mate/logic/models/tds_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'tds_event.dart';
part 'tds_state.dart';
part 'tds_bloc.freezed.dart';

@singleton
class TdsBloc extends Bloc<TdsEvent, TdsState> {
  TdsBloc(this.profileUsecase) : super(TdsState.initial()) {
    on<TdsEvent>((event, emit) async {
      await event.map(
        initialize: (_Initialize value) {
          emit(TdsState.initial());
        },
        onFilterYearChanged: (_OnFilterYearChanged value) {
          emit(state.copyWith(year: value.year));
        },
        fetchTds: (_fetchTds value) async {
          emit(state.copyWith(state: RequestState.loading));
          final res = await profileUsecase.fetchTdsDetails(year: state.year);
          res.fold((l) {
            emit(state.copyWith(state: RequestState.error, message: l.message));
          }, (r) {
            emit(state.copyWith(
                state: RequestState.loaded,
                response: r,
                total: r?.totalTds ?? 0,
                startYear: r?.fileterOption.startYear ?? DateTime.now().year,
                endYear: r?.fileterOption.endYear ?? DateTime.now().year,
                listOfTds: r?.tdsList ?? []));
          });
        },
      );
    });
  }

  final ProfileUsecase profileUsecase;
}
