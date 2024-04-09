// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/repos/authentication_repos/sign_in_repo/sign_in_repo_ds_impl.dart'
    as _i7;
import '../../data/repos/authentication_repos/sign_in_repo/sign_in_repo_impl.dart'
    as _i11;
import '../../data/repos/authentication_repos/sign_up_repo/sign_up_repo_ds_impl.dart'
    as _i5;
import '../../data/repos/authentication_repos/sign_up_repo/sign_up_repo_impl.dart'
    as _i9;
import '../../data/utils/shared_prefs_utils.dart' as _i3;
import '../../ui/screens/authentication/sign_in/sign_in_view_model.dart'
    as _i14;
import '../../ui/screens/authentication/sign_up/sign_up_view_model.dart'
    as _i15;
import '../repos/authentication_repos/sign_in_repo/sign_in_repo.dart' as _i10;
import '../repos/authentication_repos/sign_in_repo/sign_in_repo_ds.dart' as _i6;
import '../repos/authentication_repos/sign_up_repo/sign_up_repo.dart' as _i8;
import '../repos/authentication_repos/sign_up_repo/sign_up_repo_ds.dart' as _i4;
import '../use_cases/authentication_use_cases/sign_in_use_case.dart' as _i12;
import '../use_cases/authentication_use_cases/sign_up_use_case.dart' as _i13;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.SharedPrefsUtils>(() => _i3.SharedPrefsUtils());
    gh.factory<_i4.SignUpRepoDS>(
        () => _i5.SignUpRepoDSImpl(gh<_i3.SharedPrefsUtils>()));
    gh.factory<_i6.SignInRepoDS>(
        () => _i7.SignInRepoDSImpl(gh<_i3.SharedPrefsUtils>()));
    gh.factory<_i8.SignUpRepo>(
        () => _i9.SignUpRepoImpl(gh<_i4.SignUpRepoDS>()));
    gh.factory<_i10.SignInRepo>(
        () => _i11.SignInRepoImpl(gh<_i6.SignInRepoDS>()));
    gh.factory<_i12.SignInUseCase>(
        () => _i12.SignInUseCase(gh<_i10.SignInRepo>()));
    gh.factory<_i13.SignUpUseCase>(
        () => _i13.SignUpUseCase(gh<_i8.SignUpRepo>()));
    gh.factory<_i14.SignInViewModel>(
        () => _i14.SignInViewModel(gh<_i12.SignInUseCase>()));
    gh.factory<_i15.SignUpViewModel>(
        () => _i15.SignUpViewModel(gh<_i13.SignUpUseCase>()));
    return this;
  }
}
