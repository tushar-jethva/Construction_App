import 'package:bloc/bloc.dart';
import 'package:construction_mate/data/repository/billing_party_repository.dart';
import 'package:construction_mate/logic/models/billing_party_model.dart';
import 'package:meta/meta.dart';

part 'billing_parties_home_event.dart';
part 'billing_parties_home_state.dart';

class BillingPartiesHomeBloc
    extends Bloc<BillingPartiesHomeEvent, BillingPartiesHomeState> {
  final BillingPartyRepository billingPartyRepository;
  BillingPartiesHomeBloc({required this.billingPartyRepository})
      : super(BillingPartiesHomeLoading()) {
    on<BillingPartiesLoadEvent>((event, emit) async {
      try {
        emit(BillingPartiesHomeLoading());
        List<BillingPartyModel> billingParties =
            await billingPartyRepository.getAllParties();
        emit(BillingPartiesHomeLoaded(billingParties: billingParties));
      } catch (e) {
        emit(BillingPartiesHomeFailure());
      }
    });
  }
}
