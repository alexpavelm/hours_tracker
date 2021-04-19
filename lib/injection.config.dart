// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:authentication_repository/authentication_repository.dart'
    as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:record_repository/record_repository.dart' as _i5;

import 'blocs/authentication/authentication_bloc.dart' as _i7;
import 'blocs/login/login_cubit.dart' as _i4;
import 'blocs/record/record_bloc.dart' as _i8;
import 'blocs/sign_up/sign_up_cubit.dart' as _i6;
import 'injectable_modules/authentication_repository_injectable_module.dart'
    as _i9;
import 'injectable_modules/record_repository_injectable_module.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final authenticationRepositoryInjectableModule =
      _$AuthenticationRepositoryInjectableModule();
  final recordRepositoryInjectableModule = _$RecordRepositoryInjectableModule();
  gh.lazySingleton<_i3.AuthenticationRepository>(
      () => authenticationRepositoryInjectableModule.authenticationRepository);
  gh.factory<_i4.LoginCubit>(
      () => _i4.LoginCubit(get<_i3.AuthenticationRepository>()));
  gh.lazySingleton<_i5.RecordRepository>(
      () => recordRepositoryInjectableModule.recordRepository);
  gh.factory<_i6.SignUpCubit>(
      () => _i6.SignUpCubit(get<_i3.AuthenticationRepository>()));
  gh.factory<_i7.AuthenticationBloc>(() => _i7.AuthenticationBloc(
      authenticationRepository: get<_i3.AuthenticationRepository>()));
  gh.factory<_i8.RecordBloc>(
      () => _i8.RecordBloc(recordRepository: get<_i5.RecordRepository>()));
  return get;
}

class _$AuthenticationRepositoryInjectableModule
    extends _i9.AuthenticationRepositoryInjectableModule {}

class _$RecordRepositoryInjectableModule
    extends _i10.RecordRepositoryInjectableModule {}
