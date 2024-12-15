import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/usecases/profile_usecase.dart';
import 'package:construction_mate/logic/models/gst_model.dart';
import 'package:construction_mate/logic/models/others_transaction_data_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'gst_event.dart';
part 'gst_state.dart';
part 'gst_bloc.freezed.dart';

@singleton
class GstBloc extends Bloc<GstEvent, GstState> {
  GstBloc(this.profileUsecase) : super(GstState.initial()) {
    on<GstEvent>((event, emit) async {
      await event.map(
        initialize: (_Initialize value) {
          emit(GstState.initial());
        },
        onFilterYearChanged: (_OnFilterYearChanged value) {
          emit(state.copyWith(year: value.year));
        },
        fetchGst: (_fetchGst value) async {
          emit(state.copyWith(state: RequestState.loading));
          final res = await profileUsecase.fetchGstDetails(year: state.year);
          res.fold((l) {
            emit(state.copyWith(state: RequestState.error, message: l.message));
          }, (r) {
            emit(state.copyWith(
                state: RequestState.loaded,
                response: r,
                total: r?.totalGst ?? 0,
                startYear: r?.fileterOption.startYear ?? DateTime.now().year,
                endYear: r?.fileterOption.endYear ?? DateTime.now().year,
                listOfGst: r?.gstList ?? []));
          });
        },
      );
    });
  }

  final ProfileUsecase profileUsecase;
}
