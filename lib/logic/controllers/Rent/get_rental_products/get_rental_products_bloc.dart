import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/repository/rental_repository.dart';
import 'package:construction_mate/logic/models/get_rental_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'get_rental_products_event.dart';
part 'get_rental_products_state.dart';
part 'get_rental_products_bloc.freezed.dart';

@singleton
class GetRentalProductsBloc
    extends Bloc<GetRentalProductsEvent, GetRentalProductsState> {
  GetRentalProductsBloc(this.rentalRepository)
      : super(GetRentalProductsState.initial()) {
    on<GetRentalProductsEvent>((event, emit) async {
      await event.map(initialize: (_Initialize value) {
        emit(GetRentalProductsState.initial());
      }, fetchAllRentalProducts: (_FetchAllRentalProducts value) async {
        final res =
            await rentalRepository.getRentals(projectId: value.projectId);

        res.fold((l) {
          emit(state.copyWith(state: RequestState.error, message: l.message));
        }, (r) {
          emit(state.copyWith(state: RequestState.loaded, rentalProducts: r));
        });
      });
    });
  }

  final RentalRepository rentalRepository;
}
