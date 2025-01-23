import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/Tds/tds_bloc.dart';
import 'package:construction_mate/logic/models/others_transaction_data_model.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:go_router/go_router.dart';

class TdsScreen extends StatelessWidget {
  const TdsScreen({super.key});

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
            children: [totalWidget(theme), 20.hx, tdsListWidget(theme)],
          ),
        ),
      ),
    );
  }

  AppBar appBarWidget(ThemeData theme, BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        "TDS",
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

  Expanded tdsListWidget(ThemeData theme) {
    return Expanded(child: BlocBuilder<TdsBloc, TdsState>(
      builder: (context, state) {
        return state.state.isLoaded
            ? ListView.builder(
                itemCount: state.listOfTds.length,
                itemBuilder: (context, index) {
                  final transaction = state.listOfTds[index];
                  return OtherTransactionCommonWidget(
                    transaction: transaction,
                  );
                })
            : state.listOfTds.isNotEmpty
                ? ListView.builder(itemBuilder: (context, index) {
                    return Skeletonizer(
                      child: OtherTransactionCommonWidget(
                          transaction: OthersTransactionDataModel()),
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
    return BlocBuilder<TdsBloc, TdsState>(
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
            BlocBuilder<TdsBloc, TdsState>(
              builder: (context, state) {
                final List<String> years = List.generate(
                  state.endYear - state.startYear + 1,
                  (index) => (state.startYear + index).toString(),
                );
                return FilterWidget(
                  years: years,
                  onSelected: (value) {
                    context
                        .read<TdsBloc>()
                        .add(TdsEvent.onFilterYearChanged(year: value));
                    context.read<TdsBloc>().add(const TdsEvent.fetchTds());
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

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key, required this.years, this.onSelected});

  final List<String> years;
  final Function(String)? onSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PopupMenuButton<String>(
      color: theme.cardColor,
      icon: Icon(
        Icons.filter_alt,
        size: 28,
        color: theme.canvasColor,
      ), // Filter Icon
      onSelected: onSelected,
      itemBuilder: (context) {
        return years.map((year) {
          return PopupMenuItem<String>(
            value: year,
            child: Text(year, style: theme.textTheme.bodyMedium),
          );
        }).toList();
      },
    );
  }
}

class OtherTransactionCommonWidget extends StatelessWidget {
  final OthersTransactionDataModel transaction;
  const OtherTransactionCommonWidget({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: theme.scaffoldBackgroundColor,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "₹ ${transaction.amount ?? 0}",
                  style: theme.textTheme.bodyMedium?.copyWith(fontSize: 22),
                ),
                Text(
                  transaction.description ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14),
                ),
              ],
            ),
            10.hx,
            Text(
              ReusableFunctions.getFormattedDate(
                  transaction.date ?? DateTime.now().toString()),
              style: theme.textTheme.titleMedium
                  ?.copyWith(fontSize: 12, color: grey),
            )
          ],
        ),
      ),
    );
  }
}
