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
import 'package:construction_mate/data/repository/authentication_repository.dart'
    as _i953;
import 'package:construction_mate/data/repository/material_repository.dart'
    as _i37;
import 'package:construction_mate/data/usecases/material_usecase.dart' as _i154;
import 'package:construction_mate/logic/controllers/AddMaterialBloc/add_material_bloc.dart'
    as _i571;
import 'package:construction_mate/logic/controllers/Authentication/SignIn/sign_in_bloc.dart'
    as _i938;
import 'package:construction_mate/logic/controllers/authenticator_watcher/authenticator_watcher_bloc.dart'
    as _i79;
import 'package:construction_mate/logic/controllers/bottomsheet/bottomsheet_bloc.dart'
    as _i465;
import 'package:construction_mate/logic/controllers/network/network_bloc.dart'
    as _i681;
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
    gh.singleton<_i79.AuthenticatorWatcherBloc>(
        () => _i79.AuthenticatorWatcherBloc());
    gh.singleton<_i465.BottomsheetBloc>(() => _i465.BottomsheetBloc());
    gh.singleton<_i681.NetworkBloc>(() => _i681.NetworkBloc());
    gh.lazySingleton<_i548.MaterialDataSource>(
        () => _i548.MaterialDataSourceImpl());
    gh.lazySingleton<_i339.AuthenticationDatasource>(
        () => _i339.AuthenticationDatasourceImpl());
    gh.lazySingleton<_i953.AuthenticationRepository>(() =>
        _i953.AuthenticationRepositoryImpl(
            gh<_i339.AuthenticationDatasource>()));
    gh.lazySingleton<_i37.MaterialRepository>(
        () => _i37.MaterialRepositoryImpl(gh<_i548.MaterialDataSource>()));
    gh.singleton<_i938.SignInBloc>(() => _i938.SignInBloc(
        authenticationRepository: gh<_i953.AuthenticationRepository>()));
    gh.singleton<_i571.AddMaterialBloc>(
        () => _i571.AddMaterialBloc(gh<_i37.MaterialRepository>()));
    gh.factory<_i154.MaterialUsecase>(
        () => _i154.MaterialUsecase(gh<_i37.MaterialRepository>()));
    return this;
  }
}
