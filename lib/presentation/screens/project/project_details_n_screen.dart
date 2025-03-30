// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/logic/controllers/AddMaterialBloc/add_material_bloc.dart';
import 'package:construction_mate/logic/controllers/AgencyWorkingInProject/agency_works_projects_bloc.dart';
import 'package:construction_mate/logic/controllers/Building-by-id/building_by_id_bloc.dart';
import 'package:construction_mate/logic/controllers/BuildingAddBloc/buildings_bloc.dart';
import 'package:construction_mate/logic/controllers/Material/material_agencies/material_agencies_bloc.dart';
import 'package:construction_mate/logic/controllers/Material/material_project_partie/material_partie_project_bloc.dart';
import 'package:construction_mate/logic/controllers/MenuBloc/menu_bloc.dart';
import 'package:construction_mate/logic/controllers/PaymentInDropDownBloc/payment_in_drop_down_bloc.dart';
import 'package:construction_mate/logic/controllers/PaymentOutDropDownBloc/payment_out_drop_down_bloc.dart';
import 'package:construction_mate/logic/controllers/PaymentTotalProjectWiseBloc/payment_total_project_bloc.dart';
import 'package:construction_mate/logic/controllers/Rent/add_rental_product/add_rental_product_bloc.dart';
import 'package:construction_mate/logic/controllers/Rent/get_rental_project/get_rental_partie_project_bloc.dart';
import 'package:construction_mate/logic/controllers/Rent/get_rental_suppliers/get_rental_suppliers_bloc.dart';
import 'package:construction_mate/logic/controllers/Rent/rental_by_id/rental_by_partie_id_bloc.dart';
import 'package:construction_mate/logic/controllers/StartAndEndDateBloc/start_and_end_date_bloc.dart';
import 'package:construction_mate/logic/controllers/TabControlBloc/tab_control_bloc.dart';
import 'package:construction_mate/logic/controllers/TransactionBuilding/transaction_building_bloc.dart';
import 'package:construction_mate/logic/controllers/project_payment_in/project_payment_in_bloc.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:construction_mate/presentation/screens/project/building_screen.dart';
import 'package:construction_mate/presentation/screens/parties/material_party/material_screen.dart';
import 'package:construction_mate/presentation/screens/project/parties_screen.dart';
import 'package:construction_mate/presentation/screens/project/rent/rent_screen.dart';
import 'package:construction_mate/presentation/screens/project/transaction_screen.dart';
import 'package:construction_mate/presentation/widgets/common/common_button.dart';
import 'package:construction_mate/presentation/widgets/details_screen_widgets/payment_in_project_dialog_widget.dart';
import 'package:construction_mate/presentation/widgets/details_screen_widgets/payment_out_project_dilog_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/constants.dart';
import 'package:construction_mate/presentation/widgets/common/common_app_bar.dart';
import 'package:construction_mate/presentation/widgets/common/draggable_scrollable_sheet.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProjectDetailsNScreen extends StatefulWidget {
  final ProjectModel projectModel;

  const ProjectDetailsNScreen({super.key, required this.projectModel});

  @override
  State<ProjectDetailsNScreen> createState() => _ProjectDetailsNScreenState();
}

class _ProjectDetailsNScreenState extends State<ProjectDetailsNScreen>
    with SingleTickerProviderStateMixin {
  late PaymentTotalProjectBloc _paymentTotalProjectBloc;
  final TextEditingController _priceInController = TextEditingController();
  final TextEditingController _priceOutController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();
  final formPaymentOutKey = GlobalKey<FormState>();
  final formPaymentInKey = GlobalKey<FormState>();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _paymentTotalProjectBloc =
        BlocProvider.of<PaymentTotalProjectBloc>(context);
    _paymentTotalProjectBloc.add(PaymentTotalProjectEvent.fetchAllTotalPayments(
        projectId: widget.projectModel.sId!));

    context.read<AgencyWorksProjectsBloc>().add(
        AgencyWorksProjectsEvent.fetchAgencies(
            projectId: widget.projectModel.sId!));

    context
        .read<BuildingByIdBloc>()
        .add(BuildingByIdEvent.getProject(project: widget.projectModel));
    context
        .read<StartAndEndDateBloc>()
        .add(const StartAndEndDateEvent.initalize());

    context
        .read<BuildingsBloc>()
        .add(LoadBuildings(projectId: widget.projectModel.sId!));

    context.read<AddMaterialBloc>().add(AddMaterialEvent.fetchAllMaterial(
        projectId: widget.projectModel.sId ?? ""));

    context.read<AddRentalProductBloc>().add(
        AddRentalProductEvent.fetchAllRental(
            projectId: widget.projectModel.sId ?? ""));

    context
        .read<MaterialAgenciesBloc>()
        .add(const MaterialAgenciesEvent.fetchMaterialAgencies());

    context
        .read<GetRentalSuppliersBloc>()
        .add(const GetRentalSuppliersEvent.fetchRentalSuppliers());

    context.read<MaterialPartieProjectBloc>().add(
        MaterialPartieProjectEvent.fetchMatrialPartieByProject(
            projectId: widget.projectModel.sId ?? ''));

    context.read<GetRentalPartieProjectBloc>().add(
        GetRentalPartieProjectEvent.fetchRentalParties(
            projectId: widget.projectModel.sId ?? ""));

    context.read<TransactionBuildingBloc>().add(
        FetchAllTransactionByProjectId(projectId: widget.projectModel.sId!));

    context.read<ProjectPaymentInBloc>().add(
        ProjectPaymentInEvent.fetchAgencies(
            projectId: widget.projectModel.sId ?? ''));

    context.read<MenuBloc>().add(const MenuEvent.onIndexChanged(index: 1));

    _tabController = TabController(
        length: 5,
        vsync: this,
        animationDuration: const Duration(milliseconds: 100),
        initialIndex: 1);
    _tabController.animation?.addListener(() {
      final int temp = _tabController.animation!.value.round();
      final menuIndex = context.read<MenuBloc>().state.index;
      if (menuIndex != temp) {
        context.read<MenuBloc>().add(MenuEvent.onIndexChanged(index: temp));
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _priceInController.dispose();
    _priceOutController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _showPaymentInDialog({required ThemeData theme}) {
    showModalBottomSheet(
        isScrollControlled: true,
        showDragHandle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        context: context,
        builder: (context) {
          return PaymentInProjectDialogWidget(
            formPaymentInKey: formPaymentInKey,
            priceInController: _priceInController,
            descriptionController: _descriptionController,
            projectId: widget.projectModel.sId ?? "",
          );
        });
  }

  void _showPaymentOutDialog({required ThemeData theme}) {
    showModalBottomSheet(
        isScrollControlled: true,
        showDragHandle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        context: context,
        builder: (context) {
          return PaymentOutProjectDialogBoxWidget(
              formPaymentOutKey: formPaymentOutKey,
              projectId: widget.projectModel.sId ?? "",
              projectName: widget.projectModel.name ?? "",
              priceOutController: _priceOutController,
              descriptionController: _descriptionController);
        });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: theme.cardColor,
        appBar: CustomAppBar(
          onTap: () {
            context.pop();
          },
          titleWidget: BlocBuilder<MenuBloc, MenuState>(
            builder: (context, state) {
              return Text(
                menus[state.index].menuName,
                style: theme.textTheme.titleLarge?.copyWith(fontSize: 18),
              );
            },
          ),
        ),
        body: Stack(
          children: [
            topAmountAndWidgetSection(theme),
            scrollableSheetWidget(context, theme),
            paymentSecton(context, theme),
          ],
        ));
  }

  Align paymentSecton(BuildContext context, ThemeData theme) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin:
            EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h, top: 10.h),
        height: 50.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomElevatedButton(
                label: "Payment In",
                backgroundColor: green,
                borderColor: transparent,
                onTap: () {
                  context
                      .read<PaymentInDropDownBloc>()
                      .add(FetchAgencyInEvent());
                  _showPaymentInDialog(theme: theme);
                },
              ),
            ),
            30.wx,
            Expanded(
              child: CustomElevatedButton(
                label: "Payment Out",
                backgroundColor: red,
                borderColor: transparent,
                onTap: () {
                  context
                      .read<PaymentOutDropDownBloc>()
                      .add(FetchBuildingsEvent(widget.projectModel.sId!));
                  context.read<PaymentOutDropDownBloc>().add(
                      AgencyTypeChangeEvent(
                          partyType: PartyType.SubContractor));
                  _showPaymentOutDialog(theme: theme);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  DraggableScrollableSheetCommonComp scrollableSheetWidget(
      BuildContext context, ThemeData theme) {
    return DraggableScrollableSheetCommonComp(
        draggableScrollableController: DraggableScrollableController(),
        stops: const [0.8, 0.98],
        initialSize: 0.8,
        minChildSize: 0.8,
        radius: 20,
        isDraggerShow: false,
        newWidget: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TabBar(
                        controller: _tabController,
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.tab,
                        padding: const EdgeInsets.only(top: 20, left: 0),
                        indicator: BoxDecoration(
                          color: transparent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        dividerHeight: 0,
                        tabAlignment: TabAlignment.start,
                        dividerColor: transparent,
                        unselectedLabelColor:
                            const Color.fromARGB(255, 27, 24, 24),
                        labelColor: Colors.white,
                        labelStyle:
                            theme.textTheme.titleLarge?.copyWith(fontSize: 8),
                        tabs: [
                          Tab(
                              child: MenuWidget(
                            name: "Parties",
                            index: 0,
                            tabController: _tabController,
                          )),
                          Tab(
                              child: MenuWidget(
                            name: "Buildings",
                            index: 1,
                            tabController: _tabController,
                          )),
                          Tab(
                              child: MenuWidget(
                            name: "Material",
                            index: 2,
                            tabController: _tabController,
                          )),
                          Tab(
                              child: MenuWidget(
                            name: "Rental",
                            index: 3,
                            tabController: _tabController,
                          )),
                          Tab(
                              child: MenuWidget(
                            name: "Transaction",
                            index: 4,
                            tabController: _tabController,
                          )),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            MyPartiesProjectScreen(
                              project: widget.projectModel,
                              scrollController: scrollController,
                            ),
                            BuildingsScreen(
                              project: widget.projectModel,
                              scrollController: scrollController,
                            ),
                            MaterialScreen(
                                project: widget.projectModel,
                                scrollController: scrollController),
                            RentalScreen(
                                project: widget.projectModel,
                                scrollController: scrollController),
                            MyTransactionScreen(
                                project: widget.projectModel,
                                scrollController: scrollController),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  Padding topAmountAndWidgetSection(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: BlocBuilder<PaymentTotalProjectBloc,
                  PaymentTotalProjectState>(
                builder: (context, state) {
                  return TopAmountWidget(
                    theme: theme,
                    title: "Amount Received",
                    amount: state.paymentIn,
                    color: green,
                  );
                },
              )),
              20.wx,
              Expanded(child: BlocBuilder<PaymentTotalProjectBloc,
                  PaymentTotalProjectState>(
                builder: (context, state) {
                  return TopAmountWidget(
                    theme: theme,
                    title: "Amount Paid",
                    amount: state.paymentOut,
                    color: red,
                  );
                },
              )),
            ],
          ),
          BlocBuilder<MenuBloc, MenuState>(
            builder: (context, state) {
              print("======= menu index in ${state.index} =============");
              return Align(
                  alignment: Alignment.centerRight,
                  child: menus[state.index].childWidget ??
                      const SizedBox.shrink());
            },
          )
        ],
      ),
    );
  }
}

class MenuWidget extends StatelessWidget {
  final String name;
  final int index;
  final TabController tabController;
  const MenuWidget(
      {super.key,
      required this.name,
      required this.index,
      required this.tabController});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<MenuBloc, MenuState>(
      builder: (context, state) {
        final isSelected = state.index == index;

        return GestureDetector(
          onTap: () {
            tabController.animateTo(index);
            context
                .read<MenuBloc>()
                .add(MenuEvent.onIndexChanged(index: index));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width / 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: isSelected ? purple : theme.cardColor,
            ),
            child: Text(
              name,
              style: theme.textTheme.titleLarge?.copyWith(
                  fontSize: 12, color: isSelected ? white : theme.canvasColor),
            ),
          ),
        );
      },
    );
  }
}

class TopAmountWidget extends StatelessWidget {
  const TopAmountWidget(
      {super.key,
      required this.theme,
      required this.title,
      required this.amount,
      required this.color});

  final ThemeData theme;
  final String title;
  final String amount;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(fontSize: 12),
          ),
          10.hx,
          Text(
            "₹ $amount",
            style: theme.textTheme.titleLarge
                ?.copyWith(fontSize: 16, color: color),
          )
        ],
      ),
    );
  }
}
