// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:construction_mate/data/datasource/authentication_datasource.dart'
    as _i339;
import 'package:construction_mate/data/datasource/material_data_source.dart'
    as _i548;
import 'package:construction_mate/data/datasource/profile_data_source.dart'
    as _i1040;
import 'package:construction_mate/data/datasource/transaction_data_source.dart'
    as _i740;
import 'package:construction_mate/data/repository/authentication_repository.dart'
    as _i953;
import 'package:construction_mate/data/repository/billing_party_repository.dart'
    as _i755;
import 'package:construction_mate/data/repository/bills_repository.dart'
    as _i17;
import 'package:construction_mate/data/repository/material_repository.dart'
    as _i37;
import 'package:construction_mate/data/repository/profile_repository.dart'
    as _i282;
import 'package:construction_mate/data/repository/transaction_repository.dart'
    as _i1072;
import 'package:construction_mate/data/usecases/material_usecase.dart' as _i154;
import 'package:construction_mate/data/usecases/profile_usecase.dart' as _i429;
import 'package:construction_mate/data/usecases/transaction_usecase.dart'
    as _i740;
import 'package:construction_mate/logic/controllers/AddBillBloc/add_bill_bloc.dart'
    as _i865;
import 'package:construction_mate/logic/controllers/AddMaterialBloc/add_material_bloc.dart'
    as _i571;
import 'package:construction_mate/logic/controllers/Authentication/SignIn/sign_in_bloc.dart'
    as _i938;
import 'package:construction_mate/logic/controllers/authenticator_watcher/authenticator_watcher_bloc.dart'
    as _i79;
import 'package:construction_mate/logic/controllers/bottomsheet/bottomsheet_bloc.dart'
    as _i465;
import 'package:construction_mate/logic/controllers/EditProfileBloc/edit_profile_bloc.dart'
    as _i503;
import 'package:construction_mate/logic/controllers/Gst/gst_bloc.dart' as _i487;
import 'package:construction_mate/logic/controllers/network/network_bloc.dart'
    as _i681;
import 'package:construction_mate/logic/controllers/OtherExpense/payment_out_other_expense_bloc.dart'
    as _i847;
import 'package:construction_mate/logic/controllers/OtherExpenseBloc/other_expense_bloc.dart'
    as _i273;
import 'package:construction_mate/logic/controllers/SubscriptionBoxBloc/subsctiption_box_bloc.dart'
    as _i660;
import 'package:construction_mate/logic/controllers/Tds/tds_bloc.dart' as _i347;
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
    gh.singleton<_i681.NetworkBloc>(() => _i681.NetworkBloc());
    gh.singleton<_i465.BottomsheetBloc>(() => _i465.BottomsheetBloc());
    gh.singleton<_i660.SubsctiptionBoxBloc>(() => _i660.SubsctiptionBoxBloc());
    gh.singleton<_i79.AuthenticatorWatcherBloc>(
        () => _i79.AuthenticatorWatcherBloc());
    gh.lazySingleton<_i548.MaterialDataSource>(
        () => _i548.MaterialDataSourceImpl());
    gh.lazySingleton<_i740.TransactionDataSource>(
        () => _i740.TransactionDataSourceImpl());
    gh.lazySingleton<_i1040.ProfileDataSource>(
        () => _i1040.ProfileDataSourceImpl());
    gh.lazySingleton<_i339.AuthenticationDatasource>(
        () => _i339.AuthenticationDatasourceImpl());
    gh.lazySingleton<_i755.BillingPartyRepository>(
        () => _i755.BillingRepositoryImpl());
    gh.lazySingleton<_i17.BillsRepository>(() => _i17.BillsRepositoryImpl());
    gh.lazySingleton<_i953.AuthenticationRepository>(() =>
        _i953.AuthenticationRepositoryImpl(
            gh<_i339.AuthenticationDatasource>()));
    gh.lazySingleton<_i1072.TransactionRepository>(() =>
        _i1072.TransactionRepositoryImpl(
            transactionDataSource: gh<_i740.TransactionDataSource>()));
    gh.lazySingleton<_i37.MaterialRepository>(
        () => _i37.MaterialRepositoryImpl(gh<_i548.MaterialDataSource>()));
    gh.singleton<_i865.AddBillBloc>(() => _i865.AddBillBloc(
          billingPartyRepository: gh<_i755.BillingPartyRepository>(),
          billsRepository: gh<_i17.BillsRepository>(),
        ));
    gh.lazySingleton<_i282.ProfileRepository>(
        () => _i282.ProfileRepositoryImpl(gh<_i1040.ProfileDataSource>()));
    gh.singleton<_i938.SignInBloc>(() => _i938.SignInBloc(
        authenticationRepository: gh<_i953.AuthenticationRepository>()));
    gh.factory<_i429.ProfileUsecase>(
        () => _i429.ProfileUsecase(gh<_i282.ProfileRepository>()));
    gh.factory<_i740.TransactionUsecase>(
        () => _i740.TransactionUsecase(gh<_i1072.TransactionRepository>()));
    gh.singleton<_i273.OtherExpenseBloc>(
        () => _i273.OtherExpenseBloc(gh<_i429.ProfileUsecase>()));
    gh.singleton<_i487.GstBloc>(
        () => _i487.GstBloc(gh<_i429.ProfileUsecase>()));
    gh.singleton<_i503.EditProfileBloc>(
        () => _i503.EditProfileBloc(gh<_i429.ProfileUsecase>()));
    gh.singleton<_i347.TdsBloc>(
        () => _i347.TdsBloc(gh<_i429.ProfileUsecase>()));
    gh.singleton<_i571.AddMaterialBloc>(
        () => _i571.AddMaterialBloc(gh<_i37.MaterialRepository>()));
    gh.factory<_i154.MaterialUsecase>(
        () => _i154.MaterialUsecase(gh<_i37.MaterialRepository>()));
    gh.singleton<_i847.PaymentOutOtherExpenseBloc>(
        () => _i847.PaymentOutOtherExpenseBloc(gh<_i740.TransactionUsecase>()));
    return this;
  }
}
