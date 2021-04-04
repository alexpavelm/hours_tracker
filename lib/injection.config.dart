// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:authentication_repository/authentication_repository.dart'
    as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'blocs/authentication/authentication_bloc.dart' as _i5;
import 'blocs/login/login_cubit.dart' as _i4;
import 'injectable_modules/authentication_repository_injectable_module.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final authenticationRepositoryInjectableModule =
      _$AuthenticationRepositoryInjectableModule();
  gh.lazySingleton<_i3.AuthenticationRepository>(
      () => authenticationRepositoryInjectableModule.authenticationRepository);
  gh.factory<_i4.LoginCubit>(
      () => _i4.LoginCubit(get<_i3.AuthenticationRepository>()));
  gh.factory<_i5.AuthenticationBloc>(() => _i5.AuthenticationBloc(
      authenticationRepository: get<_i3.AuthenticationRepository>()));
  return get;
}

class _$AuthenticationRepositoryInjectableModule
    extends _i6.AuthenticationRepositoryInjectableModule {}
