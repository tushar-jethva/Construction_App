// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:construction_mate/data/datasource/agency_data_source.dart'
    as _i72;
import 'package:construction_mate/data/datasource/authentication_datasource.dart'
    as _i339;
import 'package:construction_mate/data/datasource/building_data_source.dart'
    as _i330;
import 'package:construction_mate/data/datasource/material_data_source.dart'
    as _i548;
import 'package:construction_mate/data/datasource/profile_data_source.dart'
    as _i1040;
import 'package:construction_mate/data/datasource/project_data_source.dart'
    as _i872;
import 'package:construction_mate/data/datasource/rental_data_source.dart'
    as _i918;
import 'package:construction_mate/data/datasource/transaction_data_source.dart'
    as _i740;
import 'package:construction_mate/data/repository/agency_repository.dart'
    as _i993;
import 'package:construction_mate/data/repository/authentication_repository.dart'
    as _i953;
import 'package:construction_mate/data/repository/billing_party_repository.dart'
    as _i755;
import 'package:construction_mate/data/repository/bills_repository.dart'
    as _i17;
import 'package:construction_mate/data/repository/building_repository.dart'
    as _i203;
import 'package:construction_mate/data/repository/material_repository.dart'
    as _i37;
import 'package:construction_mate/data/repository/profile_repository.dart'
    as _i282;
import 'package:construction_mate/data/repository/project_repository.dart'
    as _i841;
import 'package:construction_mate/data/repository/rental_repository.dart'
    as _i425;
import 'package:construction_mate/data/repository/transaction_repository.dart'
    as _i1072;
import 'package:construction_mate/data/usecases/material_usecase.dart' as _i154;
import 'package:construction_mate/data/usecases/profile_usecase.dart' as _i429;
import 'package:construction_mate/data/usecases/rental_usecase.dart' as _i577;
import 'package:construction_mate/data/usecases/transaction_usecase.dart'
    as _i740;
import 'package:construction_mate/logic/controllers/AddBillBloc/add_bill_bloc.dart'
    as _i865;
import 'package:construction_mate/logic/controllers/AddMaterialBloc/add_material_bloc.dart'
    as _i571;
import 'package:construction_mate/logic/controllers/AgencyWorkingInProject/agency_works_projects_bloc.dart'
    as _i329;
import 'package:construction_mate/logic/controllers/Authentication/forgot_password/forgot_password_bloc.dart'
    as _i962;
import 'package:construction_mate/logic/controllers/Authentication/reset_password/reset_password_bloc.dart'
    as _i893;
import 'package:construction_mate/logic/controllers/Authentication/SignIn/sign_in_bloc.dart'
    as _i938;
import 'package:construction_mate/logic/controllers/Authentication/verify_otp/verify_otp_bloc.dart'
    as _i4;
import 'package:construction_mate/logic/controllers/authenticator_watcher/authenticator_watcher_bloc.dart'
    as _i79;
import 'package:construction_mate/logic/controllers/bottomsheet/bottomsheet_bloc.dart'
    as _i465;
import 'package:construction_mate/logic/controllers/Building-by-id/building_by_id_bloc.dart'
    as _i882;
import 'package:construction_mate/logic/controllers/Gst/gst_bloc.dart' as _i487;
import 'package:construction_mate/logic/controllers/Material/material_agencies/material_agencies_bloc.dart'
    as _i40;
import 'package:construction_mate/logic/controllers/Material/material_by_partie/material_by_partie_bloc.dart'
    as _i737;
import 'package:construction_mate/logic/controllers/Material/material_project_partie/material_partie_project_bloc.dart'
    as _i460;
import 'package:construction_mate/logic/controllers/Material/MaterialSupplier/material_supplier_bloc.dart'
    as _i840;
import 'package:construction_mate/logic/controllers/MenuBloc/menu_bloc.dart'
    as _i688;
import 'package:construction_mate/logic/controllers/network/network_bloc.dart'
    as _i681;
import 'package:construction_mate/logic/controllers/Onboard/onboard_bloc.dart'
    as _i593;
import 'package:construction_mate/logic/controllers/OtherExpense/payment_out_other_expense_bloc.dart'
    as _i847;
import 'package:construction_mate/logic/controllers/OtherExpenseBloc/other_expense_bloc.dart'
    as _i273;
import 'package:construction_mate/logic/controllers/Parties/add_parties/add_parties_bloc.dart'
    as _i625;
import 'package:construction_mate/logic/controllers/PaymentOutDropDownBloc/payment_out_drop_down_bloc.dart'
    as _i435;
import 'package:construction_mate/logic/controllers/PaymentOutOtherMaterailAndRentBloc/payment_out_other_material_and_rent_bloc.dart'
    as _i758;
import 'package:construction_mate/logic/controllers/PaymentTotalProjectWiseBloc/payment_total_project_bloc.dart'
    as _i585;
import 'package:construction_mate/logic/controllers/Profile/EditProfileBloc/edit_profile_bloc.dart'
    as _i527;
import 'package:construction_mate/logic/controllers/Profile/user-watcher/user_watcher_bloc.dart'
    as _i95;
import 'package:construction_mate/logic/controllers/project_payment_in/project_payment_in_bloc.dart'
    as _i418;
import 'package:construction_mate/logic/controllers/Rent/add_rent_supplier/add_rent_supplier_bloc.dart'
    as _i119;
import 'package:construction_mate/logic/controllers/Rent/add_rental_product/add_rental_product_bloc.dart'
    as _i549;
import 'package:construction_mate/logic/controllers/Rent/get_rental_products/get_rental_products_bloc.dart'
    as _i449;
import 'package:construction_mate/logic/controllers/Rent/get_rental_project/get_rental_partie_project_bloc.dart'
    as _i883;
import 'package:construction_mate/logic/controllers/Rent/get_rental_suppliers/get_rental_suppliers_bloc.dart'
    as _i452;
import 'package:construction_mate/logic/controllers/Rent/rental_by_id/rental_by_partie_id_bloc.dart'
    as _i269;
import 'package:construction_mate/logic/controllers/SubscriptionBoxBloc/subsctiption_box_bloc.dart'
    as _i660;
import 'package:construction_mate/logic/controllers/TabControlBloc/tab_control_bloc.dart'
    as _i379;
import 'package:construction_mate/logic/controllers/Tds/tds_bloc.dart' as _i347;
import 'package:construction_mate/logic/controllers/TotalPaymentOutBloc/total_payment_out_bloc.dart'
    as _i201;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i882.BuildingByIdBloc>(() => _i882.BuildingByIdBloc());
    gh.singleton<_i688.MenuBloc>(() => _i688.MenuBloc());
    gh.singleton<_i681.NetworkBloc>(() => _i681.NetworkBloc());
    gh.singleton<_i593.OnboardBloc>(() => _i593.OnboardBloc());
    gh.singleton<_i465.BottomsheetBloc>(() => _i465.BottomsheetBloc());
    gh.singleton<_i660.SubsctiptionBoxBloc>(() => _i660.SubsctiptionBoxBloc());
    gh.singleton<_i79.AuthenticatorWatcherBloc>(
        () => _i79.AuthenticatorWatcherBloc());
    gh.singleton<_i625.AddPartiesBloc>(() => _i625.AddPartiesBloc());
    gh.singleton<_i379.TabControlBloc>(() => _i379.TabControlBloc());
    gh.lazySingleton<_i548.MaterialDataSource>(
        () => _i548.MaterialDataSourceImpl());
    gh.lazySingleton<_i740.TransactionDataSource>(
        () => _i740.TransactionDataSourceImpl());
    gh.lazySingleton<_i330.BuildingDataSource>(
        () => _i330.BuildingDataSourceImpl());
    gh.lazySingleton<_i918.RentalDataSource>(
        () => _i918.RentalDataSourceImpl());
    gh.lazySingleton<_i1040.ProfileDataSource>(
        () => _i1040.ProfileDataSourceImpl());
    gh.lazySingleton<_i872.ProjectDataSource>(
        () => _i872.ProjectDataSourceImpl());
    gh.lazySingleton<_i72.AgencyDataSource>(
        () => _i72.AgencyDataSourceDataSourceImpl());
    gh.lazySingleton<_i339.AuthenticationDatasource>(
        () => _i339.AuthenticationDatasourceImpl());
    gh.lazySingleton<_i755.BillingPartyRepository>(
        () => _i755.BillingRepositoryImpl());
    gh.lazySingleton<_i841.ProjectRepository>(
        () => _i841.ProjectRepositoryImpl(gh<_i872.ProjectDataSource>()));
    gh.lazySingleton<_i17.BillsRepository>(() => _i17.BillsRepositoryImpl());
    gh.lazySingleton<_i953.AuthenticationRepository>(() =>
        _i953.AuthenticationRepositoryImpl(
            gh<_i339.AuthenticationDatasource>()));
    gh.lazySingleton<_i1072.TransactionRepository>(() =>
        _i1072.TransactionRepositoryImpl(
            transactionDataSource: gh<_i740.TransactionDataSource>()));
    gh.lazySingleton<_i203.BuildingRepository>(
        () => _i203.BuildingRepositoryImpl(gh<_i330.BuildingDataSource>()));
    gh.lazySingleton<_i37.MaterialRepository>(
        () => _i37.MaterialRepositoryImpl(gh<_i548.MaterialDataSource>()));
    gh.singleton<_i418.ProjectPaymentInBloc>(() => _i418.ProjectPaymentInBloc(
          gh<_i1072.TransactionRepository>(),
          gh<_i755.BillingPartyRepository>(),
        ));
    gh.lazySingleton<_i282.ProfileRepository>(
        () => _i282.ProfileRepositoryImpl(gh<_i1040.ProfileDataSource>()));
    gh.lazySingleton<_i993.AgencyRepository>(() => _i993.AgencyRepositoryImpl(
        agencyDataSource: gh<_i72.AgencyDataSource>()));
    gh.singleton<_i40.MaterialAgenciesBloc>(
        () => _i40.MaterialAgenciesBloc(gh<_i993.AgencyRepository>()));
    gh.singleton<_i452.GetRentalSuppliersBloc>(
        () => _i452.GetRentalSuppliersBloc(gh<_i993.AgencyRepository>()));
    gh.singleton<_i938.SignInBloc>(() => _i938.SignInBloc(
        authenticationRepository: gh<_i953.AuthenticationRepository>()));
    gh.singleton<_i329.AgencyWorksProjectsBloc>(() =>
        _i329.AgencyWorksProjectsBloc(
            agencyRepository: gh<_i993.AgencyRepository>()));
    gh.lazySingleton<_i425.RentalRepository>(() =>
        _i425.RentalRepositoryImpl(dataSource: gh<_i918.RentalDataSource>()));
    gh.factory<_i577.RentalUsecase>(
        () => _i577.RentalUsecase(gh<_i425.RentalRepository>()));
    gh.factory<_i429.ProfileUsecase>(
        () => _i429.ProfileUsecase(gh<_i282.ProfileRepository>()));
    gh.singleton<_i201.TotalPaymentOutBloc>(() => _i201.TotalPaymentOutBloc(
        transactionRepository: gh<_i1072.TransactionRepository>()));
    gh.singleton<_i585.PaymentTotalProjectBloc>(() =>
        _i585.PaymentTotalProjectBloc(
            transactionRepository: gh<_i1072.TransactionRepository>()));
    gh.singleton<_i549.AddRentalProductBloc>(() => _i549.AddRentalProductBloc(
          gh<_i577.RentalUsecase>(),
          gh<_i452.GetRentalSuppliersBloc>(),
        ));
    gh.singleton<_i269.RentalByPartieIdBloc>(
        () => _i269.RentalByPartieIdBloc(gh<_i577.RentalUsecase>()));
    gh.singleton<_i883.GetRentalPartieProjectBloc>(
        () => _i883.GetRentalPartieProjectBloc(gh<_i577.RentalUsecase>()));
    gh.singleton<_i840.MaterialSupplierBloc>(
        () => _i840.MaterialSupplierBloc(gh<_i993.AgencyRepository>()));
    gh.singleton<_i119.AddRentSupplierBloc>(
        () => _i119.AddRentSupplierBloc(gh<_i993.AgencyRepository>()));
    gh.factory<_i740.TransactionUsecase>(
        () => _i740.TransactionUsecase(gh<_i1072.TransactionRepository>()));
    gh.singleton<_i962.ForgotPasswordBloc>(
        () => _i962.ForgotPasswordBloc(gh<_i953.AuthenticationRepository>()));
    gh.singleton<_i273.OtherExpenseBloc>(
        () => _i273.OtherExpenseBloc(gh<_i429.ProfileUsecase>()));
    gh.singleton<_i487.GstBloc>(
        () => _i487.GstBloc(gh<_i429.ProfileUsecase>()));
    gh.singleton<_i347.TdsBloc>(
        () => _i347.TdsBloc(gh<_i429.ProfileUsecase>()));
    gh.singleton<_i95.UserWatcherBloc>(
        () => _i95.UserWatcherBloc(gh<_i429.ProfileUsecase>()));
    gh.singleton<_i435.PaymentOutDropDownBloc>(
        () => _i435.PaymentOutDropDownBloc(
              buildingRepository: gh<_i203.BuildingRepository>(),
              agencyRepository: gh<_i993.AgencyRepository>(),
              projectRepository: gh<_i841.ProjectRepository>(),
              transactionRepository: gh<_i1072.TransactionRepository>(),
            ));
    gh.singleton<_i865.AddBillBloc>(() => _i865.AddBillBloc(
          agencyRepository: gh<_i993.AgencyRepository>(),
          billsRepository: gh<_i17.BillsRepository>(),
        ));
    gh.singleton<_i449.GetRentalProductsBloc>(
        () => _i449.GetRentalProductsBloc(gh<_i425.RentalRepository>()));
    gh.singleton<_i571.AddMaterialBloc>(() => _i571.AddMaterialBloc(
          gh<_i37.MaterialRepository>(),
          gh<_i40.MaterialAgenciesBloc>(),
        ));
    gh.factory<_i154.MaterialUsecase>(
        () => _i154.MaterialUsecase(gh<_i37.MaterialRepository>()));
    gh.singleton<_i4.VerifyOtpBloc>(() => _i4.VerifyOtpBloc(
          gh<_i953.AuthenticationRepository>(),
          gh<_i962.ForgotPasswordBloc>(),
        ));
    gh.singleton<_i893.ResetPasswordBloc>(() => _i893.ResetPasswordBloc(
          gh<_i953.AuthenticationRepository>(),
          gh<_i962.ForgotPasswordBloc>(),
        ));
    gh.singleton<_i737.MaterialByPartieBloc>(
        () => _i737.MaterialByPartieBloc(gh<_i154.MaterialUsecase>()));
    gh.singleton<_i460.MaterialPartieProjectBloc>(
        () => _i460.MaterialPartieProjectBloc(gh<_i154.MaterialUsecase>()));
    gh.singleton<_i758.PaymentOutOtherMaterialAndRentBloc>(
        () => _i758.PaymentOutOtherMaterialAndRentBloc(
              gh<_i435.PaymentOutDropDownBloc>(),
              gh<_i740.TransactionUsecase>(),
            ));
    gh.singleton<_i847.PaymentOutOtherExpenseBloc>(
        () => _i847.PaymentOutOtherExpenseBloc(gh<_i740.TransactionUsecase>()));
    gh.singleton<_i527.EditProfileBloc>(() => _i527.EditProfileBloc(
          gh<_i429.ProfileUsecase>(),
          gh<_i95.UserWatcherBloc>(),
        ));
    return this;
  }
}
