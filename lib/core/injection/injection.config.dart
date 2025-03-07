// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_application_1/application/signup/signup_bloc.dart'
    as _i301;
import 'package:flutter_application_1/domain/auth/i_auth_repository.dart'
    as _i824;
import 'package:flutter_application_1/infrastructure/auth/auth_repository.dart'
    as _i466;
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
    gh.lazySingleton<_i824.IAuthRepository>(() => _i466.AuthRepository());
    gh.factory<_i301.SignupBloc>(
        () => _i301.SignupBloc(gh<_i824.IAuthRepository>()));
    return this;
  }
}
