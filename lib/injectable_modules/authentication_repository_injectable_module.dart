
import 'package:injectable/injectable.dart';
import 'package:authentication_repository/authentication_repository.dart';

@module
abstract class AuthenticationRepositoryInjectableModule {

  @lazySingleton
  AuthenticationRepository get authenticationRepository => AuthenticationRepository();
}