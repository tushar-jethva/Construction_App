import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/logic/controllers/Parties/add_parties/add_parties_bloc.dart';
import 'package:construction_mate/presentation/screens/parties/parties_screen.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AddAllPartiesScreen extends StatelessWidget {
  const AddAllPartiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final theme = Theme.of(context);
    return Padding(
      padding: mediaQueryData.viewInsets,
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  topRight: Radius.circular(15.r))),
          child: Column(
            children: [
              BlocBuilder<AddPartiesBloc, AddPartiesState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      RadioMenuButton(
                          value: PartyType.Agency,
                          groupValue: state.partyType,
                          onChanged: (val) {
                            context.read<AddPartiesBloc>().add(
                                AddPartiesEvent.onPartyTypeChange(
                                    partyType: val ?? PartyType.Agency));
                            context.pushNamed(
                                RoutesName.ADD_PARTICULAR_PARTY_SCREEN_NAME);
                          },
                          child: Text(
                            "Agency",
                            style: theme.textTheme.titleMedium,
                          )),
                      RadioMenuButton(
                          value: PartyType.BillingParty,
                          groupValue: state.partyType,
                          onChanged: (val) {
                            context.read<AddPartiesBloc>().add(
                                AddPartiesEvent.onPartyTypeChange(
                                    partyType: val ?? PartyType.Agency));
                            context.pushNamed(
                                RoutesName.ADD_PARTICULAR_PARTY_SCREEN_NAME);
                          },
                          child: Text(
                            "Billing Party",
                            style: theme.textTheme.titleMedium,
                          )),
                      RadioMenuButton(
                          value: PartyType.Material,
                          groupValue: state.partyType,
                          onChanged: (val) {
                            context.read<AddPartiesBloc>().add(
                                AddPartiesEvent.onPartyTypeChange(
                                    partyType: val ?? PartyType.Agency));
                            context.pushNamed(
                                RoutesName.ADD_PARTICULAR_PARTY_SCREEN_NAME);
                          },
                          child: Text(
                            "Material",
                            style: theme.textTheme.titleMedium,
                          )),
                      RadioMenuButton(
                          value: PartyType.Vendor,
                          groupValue: state.partyType,
                          onChanged: (val) {
                            context.read<AddPartiesBloc>().add(
                                AddPartiesEvent.onPartyTypeChange(
                                    partyType: val ?? PartyType.Agency));
                            context.pushNamed(
                                RoutesName.ADD_PARTICULAR_PARTY_SCREEN_NAME);
                          },
                          child: Text(
                            "Vendor",
                            style: theme.textTheme.titleMedium,
                          )),
                      50.hx,
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
