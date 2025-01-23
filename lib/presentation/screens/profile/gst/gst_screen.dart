import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/logic/controllers/Gst/gst_bloc.dart';
import 'package:construction_mate/logic/controllers/Tds/tds_bloc.dart';
import 'package:construction_mate/logic/models/others_transaction_data_model.dart';
import 'package:construction_mate/presentation/screens/profile/tds/tds_screen.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GstScreen extends StatelessWidget {
  const GstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.cardColor,
      appBar: appBarWidget(theme, context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [totalWidget(theme), 20.hx, gstListWidget(theme)],
          ),
        ),
      ),
    );
  }

  AppBar appBarWidget(ThemeData theme, BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        "GST",
        style: theme.textTheme.titleLarge,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: theme.canvasColor,
          )),
    );
  }

  Expanded gstListWidget(ThemeData theme) {
    return Expanded(child: BlocBuilder<GstBloc, GstState>(
      builder: (context, state) {
        return state.state.isLoading
            ? ListView.builder(itemBuilder: (context, index) {
                return Skeletonizer(
                  child: OtherTransactionCommonWidget(
                      transaction: OthersTransactionDataModel()),
                );
              })
            : state.listOfGst.isNotEmpty
                ? ListView.builder(
                    itemCount: state.listOfGst.length,
                    itemBuilder: (context, index) {
                      final transaction = state.listOfGst[index];
                      return OtherTransactionCommonWidget(
                        transaction: transaction,
                      );
                    })
                : Center(
                    child: Text(
                    "No data found!",
                    style: theme.textTheme.bodyMedium,
                  ));
      },
    ));
  }

  Widget totalWidget(
    ThemeData theme,
  ) {
    return BlocBuilder<GstBloc, GstState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: theme.scaffoldBackgroundColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total",
                      style: theme.textTheme.titleLarge
                          ?.copyWith(fontSize: 13, color: grey),
                    ),
                    Text(
                      "₹ ${state.total}",
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(fontSize: 26, color: green),
                    )
                  ],
                ),
              ),
            ),
            BlocBuilder<GstBloc, GstState>(
              builder: (context, state) {
                final List<String> years = List.generate(
                  state.endYear - state.startYear + 1,
                  (index) => (state.startYear + index).toString(),
                );
                return FilterWidget(
                  years: years,
                  onSelected: (value) {
                    context
                        .read<GstBloc>()
                        .add(GstEvent.onFilterYearChanged(year: value));
                    context.read<GstBloc>().add(const GstEvent.fetchGst());
                  },
                );
              },
            )
          ],
        );
      },
    );
  }
}
