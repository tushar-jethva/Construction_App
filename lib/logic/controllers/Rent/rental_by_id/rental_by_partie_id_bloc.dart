import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/usecases/rental_usecase.dart';
import 'package:construction_mate/logic/models/get_rental_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

part 'rental_by_partie_id_event.dart';
part 'rental_by_partie_id_state.dart';
part 'rental_by_partie_id_bloc.freezed.dart';

@singleton
class RentalByPartieIdBloc
    extends Bloc<RentalByPartieIdEvent, RentalByPartieIdState> {
  RentalByPartieIdBloc(this.rentalUsecase)
      : super(RentalByPartieIdState.initial()) {
    on<RentalByPartieIdEvent>((event, emit) async {
      await event.map(
          started: (_Started value) {},
          getRentalByPartie: (_GetRentalByPartie value) async {
            emit(state.copyWith(state: RequestState.loading));
            final res =
                await rentalUsecase.getRentalByPartie(partieId: value.partieId);

            res.fold((l) {
              emit(state.copyWith(
                  state: RequestState.error, message: l.message));
            }, (r) {
              emit(
                  state.copyWith(state: RequestState.loaded, listOfRentals: r));
            });
          });
    });
  }

  final RentalUsecase rentalUsecase;
}
