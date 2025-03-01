import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/data/datasource/agency_data_source.dart';
import 'package:construction_mate/data/datasource/work_types_source.dart';
import 'package:construction_mate/data/repository/agency_repository.dart';
import 'package:construction_mate/data/repository/work_type_repository.dart';
import 'package:construction_mate/logic/controllers/AgencyWorkTypeSelection/agency_work_types_selection_bloc.dart';
import 'package:construction_mate/logic/controllers/Parties/add_parties/add_parties_bloc.dart';
import 'package:construction_mate/presentation/widgets/common/common_app_bar.dart';
import 'package:construction_mate/presentation/widgets/parties_screen_widgets/add_agency_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddParticularPartyScreen extends StatelessWidget {
  const AddParticularPartyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: transparent,
        backgroundColor: theme.scaffoldBackgroundColor,
        title: BlocBuilder<AddPartiesBloc, AddPartiesState>(
          builder: (context, state) {
            return Text(state.partyType.name);
          },
        ),
      ),
      body: BlocBuilder<AddPartiesBloc, AddPartiesState>(
        builder: (context, state) {
          return state.partyType.isAgency
              ? BlocProvider(
                  create: (context) => AgencyWorkTypesSelectionBloc(
                      agencyRepository: AgencyRepositoryImpl(
                          agencyDataSource: AgencyDataSourceDataSourceImpl()),
                      workTypesRepository:
                          WorkTypesRepositoryImpl(WorkTypesDataSourceImpl())),
                  child: const MyAddAgencyBottomSheetParties(),
                )
              : const SizedBox();
        },
      ),
    );
  }
}
