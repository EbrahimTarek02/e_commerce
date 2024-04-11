// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo_ds_impl.dart'
    as _i9;
import '../../data/repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo_impl.dart'
    as _i21;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo_ds_impl.dart'
    as _i5;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo_impl.dart'
    as _i19;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_sent_code_reo/verify_sent_code_repo_ds_impl.dart'
    as _i7;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_sent_code_reo/verify_sent_code_repo_impl.dart'
    as _i11;
import '../../data/repos/authentication_repos/sign_in_repo/sign_in_repo_ds_impl.dart'
    as _i15;
import '../../data/repos/authentication_repos/sign_in_repo/sign_in_repo_impl.dart'
    as _i23;
import '../../data/repos/authentication_repos/sign_up_repo/sign_up_repo_ds_impl.dart'
    as _i13;
import '../../data/repos/authentication_repos/sign_up_repo/sign_up_repo_impl.dart'
    as _i17;
import '../../data/utils/shared_prefs_utils.dart' as _i3;
import '../../ui/screens/authentication/forgot_password/reset_password/reset_password_view_model.dart'
    as _i30;
import '../../ui/screens/authentication/forgot_password/verify_email/verify_email_view_model.dart'
    as _i33;
import '../../ui/screens/authentication/forgot_password/verify_sent_code/verify_sent_code_view_model.dart'
    as _i31;
import '../../ui/screens/authentication/sign_in/sign_in_view_model.dart'
    as _i29;
import '../../ui/screens/authentication/sign_up/sign_up_view_model.dart'
    as _i32;
import '../repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo.dart'
    as _i20;
import '../repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo_ds.dart'
    as _i8;
import '../repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo.dart'
    as _i18;
import '../repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo_ds.dart'
    as _i4;
import '../repos/authentication_repos/forgot_password_repos/verify_sent_code_repo/verify_sent_code_repo.dart'
    as _i10;
import '../repos/authentication_repos/forgot_password_repos/verify_sent_code_repo/verify_sent_code_repo_ds.dart'
    as _i6;
import '../repos/authentication_repos/sign_in_repo/sign_in_repo.dart' as _i22;
import '../repos/authentication_repos/sign_in_repo/sign_in_repo_ds.dart'
    as _i14;
import '../repos/authentication_repos/sign_up_repo/sign_up_repo.dart' as _i16;
import '../repos/authentication_repos/sign_up_repo/sign_up_repo_ds.dart'
    as _i12;
import '../use_cases/authentication_use_cases/forgot_password_use_cases/reset_password_use_case.dart'
    as _i26;
import '../use_cases/authentication_use_cases/forgot_password_use_cases/verify_email_use_case.dart'
    as _i27;
import '../use_cases/authentication_use_cases/forgot_password_use_cases/verify_sent_code_use_case.dart'
    as _i24;
import '../use_cases/authentication_use_cases/sign_in_use_case.dart' as _i25;
import '../use_cases/authentication_use_cases/sign_up_use_case.dart' as _i28;

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
    gh.factory<_i4.VerifyEmailRepoDS>(() => _i5.VerifyEmailRepoDSImpl());
    gh.factory<_i6.VerifySentCodeRepoDS>(() => _i7.VerifySentCodeRepoDSImpl());
    gh.factory<_i8.ResetPasswordRepoDS>(() => _i9.ResetPasswordRepoDSImpl());
    gh.factory<_i10.VerifySentCodeRepo>(
        () => _i11.VerifySentCodeRepoImpl(gh<_i6.VerifySentCodeRepoDS>()));
    gh.factory<_i12.SignUpRepoDS>(
        () => _i13.SignUpRepoDSImpl(gh<_i3.SharedPrefsUtils>()));
    gh.factory<_i14.SignInRepoDS>(
        () => _i15.SignInRepoDSImpl(gh<_i3.SharedPrefsUtils>()));
    gh.factory<_i16.SignUpRepo>(
        () => _i17.SignUpRepoImpl(gh<_i12.SignUpRepoDS>()));
    gh.factory<_i18.VerifyEmailRepo>(
        () => _i19.VerifyEmailRepoImpl(gh<_i4.VerifyEmailRepoDS>()));
    gh.factory<_i20.ResetPasswordRepo>(
        () => _i21.RestPasswordRepoImpl(gh<_i8.ResetPasswordRepoDS>()));
    gh.factory<_i22.SignInRepo>(
        () => _i23.SignInRepoImpl(gh<_i14.SignInRepoDS>()));
    gh.factory<_i24.VerifySentCodeUseCase>(
        () => _i24.VerifySentCodeUseCase(gh<_i10.VerifySentCodeRepo>()));
    gh.factory<_i25.SignInUseCase>(
        () => _i25.SignInUseCase(gh<_i22.SignInRepo>()));
    gh.factory<_i26.ResetPasswordUseCase>(
        () => _i26.ResetPasswordUseCase(gh<_i20.ResetPasswordRepo>()));
    gh.factory<_i27.VerifyEmailUseCase>(
        () => _i27.VerifyEmailUseCase(gh<_i18.VerifyEmailRepo>()));
    gh.factory<_i28.SignUpUseCase>(
        () => _i28.SignUpUseCase(gh<_i16.SignUpRepo>()));
    gh.factory<_i29.SignInViewModel>(
        () => _i29.SignInViewModel(gh<_i25.SignInUseCase>()));
    gh.factory<_i30.ResetPasswordViewModel>(
        () => _i30.ResetPasswordViewModel(gh<_i26.ResetPasswordUseCase>()));
    gh.factory<_i31.VerifySentCodeViewModel>(() => _i31.VerifySentCodeViewModel(
          gh<_i27.VerifyEmailUseCase>(),
          gh<_i24.VerifySentCodeUseCase>(),
        ));
    gh.factory<_i32.SignUpViewModel>(
        () => _i32.SignUpViewModel(gh<_i28.SignUpUseCase>()));
    gh.factory<_i33.VerifyEmailViewModel>(
        () => _i33.VerifyEmailViewModel(gh<_i27.VerifyEmailUseCase>()));
    return this;
  }
}
