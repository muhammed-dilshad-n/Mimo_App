// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_application_1/application/auth/auth_bloc.dart' as _i963;
import 'package:flutter_application_1/application/forgot/forgot_bloc.dart'
    as _i230;
import 'package:flutter_application_1/application/signIn/signin_bloc.dart'
    as _i307;
import 'package:flutter_application_1/application/signup/signup_bloc.dart'
    as _i301;
import 'package:flutter_application_1/application/task/task_bloc.dart'
    as _i1028;
import 'package:flutter_application_1/application/taskdata/taskdata_bloc.dart'
    as _i25;
import 'package:flutter_application_1/application/user/user_bloc.dart' as _i383;
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
    gh.factory<_i230.ForgotBloc>(
        () => _i230.ForgotBloc(gh<_i824.IAuthRepository>()));
    gh.factory<_i307.SigninBloc>(
        () => _i307.SigninBloc(gh<_i824.IAuthRepository>()));
    gh.factory<_i301.SignupBloc>(
        () => _i301.SignupBloc(gh<_i824.IAuthRepository>()));
    gh.factory<_i1028.TaskBloc>(
        () => _i1028.TaskBloc(gh<_i824.IAuthRepository>()));
    gh.factory<_i25.TaskDataBloc>(
        () => _i25.TaskDataBloc(gh<_i824.IAuthRepository>()));
    gh.factory<_i383.UserBloc>(
        () => _i383.UserBloc(gh<_i824.IAuthRepository>()));
    gh.factory<_i963.AuthBloc>(
        () => _i963.AuthBloc(gh<_i824.IAuthRepository>()));
    return this;
  }
}
