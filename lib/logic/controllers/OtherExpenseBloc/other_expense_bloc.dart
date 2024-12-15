import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/usecases/profile_usecase.dart';
import 'package:construction_mate/logic/models/other_expense_model.dart';
import 'package:construction_mate/logic/models/others_transaction_data_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'other_expense_event.dart';
part 'other_expense_state.dart';
part 'other_expense_bloc.freezed.dart';

@singleton
class OtherExpenseBloc extends Bloc<OtherExpenseEvent, OtherExpenseState> {
  OtherExpenseBloc(this.profileUsecase) : super(OtherExpenseState.initial()) {
    on<OtherExpenseEvent>((event, emit) async {
      await event.map(
        initialize: (_Initialize value) {
          emit(OtherExpenseState.initial());
        },
        onFilterYearChanged: (_OnFilterYearChanged value) {
          emit(state.copyWith(year: value.year));
        },
        fetchOtherExpenses: (_fetchOtherExpenses value) async {
          emit(state.copyWith(state: RequestState.loading));
          final res = await profileUsecase.fetchOtherExpenseDetails(year: state.year);
          res.fold((l) {
            emit(state.copyWith(state: RequestState.error, message: l.message));
          }, (r) {
            emit(state.copyWith(
                state: RequestState.loaded,
                response: r,
                total: r?.totalExpense ?? 0,
                startYear: r?.fileterOption.startYear ?? DateTime.now().year,
                endYear: r?.fileterOption.endYear ?? DateTime.now().year,
                listOfExpenses: r?.expenseList ?? []));
          });
        },
      );
    });
  }

  final ProfileUsecase profileUsecase;
}
