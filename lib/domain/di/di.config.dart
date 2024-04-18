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
    as _i11;
import '../../data/repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo_impl.dart'
    as _i33;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo_ds_impl.dart'
    as _i7;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo_impl.dart'
    as _i31;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_sent_code_reo/verify_sent_code_repo_ds_impl.dart'
    as _i9;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_sent_code_reo/verify_sent_code_repo_impl.dart'
    as _i13;
import '../../data/repos/authentication_repos/sign_in_repo/sign_in_repo_ds_impl.dart'
    as _i27;
import '../../data/repos/authentication_repos/sign_in_repo/sign_in_repo_impl.dart'
    as _i35;
import '../../data/repos/authentication_repos/sign_up_repo/sign_up_repo_ds_impl.dart'
    as _i15;
import '../../data/repos/authentication_repos/sign_up_repo/sign_up_repo_impl.dart'
    as _i29;
import '../../data/repos/main_repos/main_repo_ds_impl.dart' as _i5;
import '../../data/repos/main_repos/main_repo_impl.dart' as _i17;
import '../../data/utils/shared_prefs_utils.dart' as _i3;
import '../../ui/screens/authentication/forgot_password/reset_password/reset_password_view_model.dart'
    as _i43;
import '../../ui/screens/authentication/forgot_password/verify_email/verify_email_view_model.dart'
    as _i46;
import '../../ui/screens/authentication/forgot_password/verify_sent_code/verify_sent_code_view_model.dart'
    as _i44;
import '../../ui/screens/authentication/sign_in/sign_in_view_model.dart'
    as _i42;
import '../../ui/screens/authentication/sign_up/sign_up_view_model.dart'
    as _i45;
import '../../ui/screens/main/main_view_model.dart' as _i40;
import '../repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo.dart'
    as _i32;
import '../repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo_ds.dart'
    as _i10;
import '../repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo.dart'
    as _i30;
import '../repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo_ds.dart'
    as _i6;
import '../repos/authentication_repos/forgot_password_repos/verify_sent_code_repo/verify_sent_code_repo.dart'
    as _i12;
import '../repos/authentication_repos/forgot_password_repos/verify_sent_code_repo/verify_sent_code_repo_ds.dart'
    as _i8;
import '../repos/authentication_repos/sign_in_repo/sign_in_repo.dart' as _i34;
import '../repos/authentication_repos/sign_in_repo/sign_in_repo_ds.dart'
    as _i26;
import '../repos/authentication_repos/sign_up_repo/sign_up_repo.dart' as _i28;
import '../repos/authentication_repos/sign_up_repo/sign_up_repo_ds.dart'
    as _i14;
import '../repos/main_repos/main_repo.dart' as _i16;
import '../repos/main_repos/main_repo_ds.dart' as _i4;
import '../use_cases/authentication_use_cases/forgot_password_use_cases/reset_password_use_case.dart'
    as _i38;
import '../use_cases/authentication_use_cases/forgot_password_use_cases/verify_email_use_case.dart'
    as _i39;
import '../use_cases/authentication_use_cases/forgot_password_use_cases/verify_sent_code_use_case.dart'
    as _i36;
import '../use_cases/authentication_use_cases/sign_in_use_case.dart' as _i37;
import '../use_cases/authentication_use_cases/sign_up_use_case.dart' as _i41;
import '../use_cases/main_use_cases/add_to_wish_list_use_case.dart' as _i24;
import '../use_cases/main_use_cases/get_all_brands_use_case.dart' as _i20;
import '../use_cases/main_use_cases/get_all_categories_use_case.dart' as _i18;
import '../use_cases/main_use_cases/get_all_products_use_case.dart' as _i19;
import '../use_cases/main_use_cases/get_products_with_brand_id_use_case.dart'
    as _i21;
import '../use_cases/main_use_cases/get_products_with_category_id_use_case.dart'
    as _i22;
import '../use_cases/main_use_cases/get_wish_list_use_case.dart' as _i23;
import '../use_cases/main_use_cases/remove_from_wish_list_use_case.dart'
    as _i25;

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
    gh.factory<_i4.MainRepoDS>(() => _i5.MainRepoDSImpl());
    gh.factory<_i6.VerifyEmailRepoDS>(() => _i7.VerifyEmailRepoDSImpl());
    gh.factory<_i8.VerifySentCodeRepoDS>(() => _i9.VerifySentCodeRepoDSImpl());
    gh.factory<_i10.ResetPasswordRepoDS>(() => _i11.ResetPasswordRepoDSImpl());
    gh.factory<_i12.VerifySentCodeRepo>(
        () => _i13.VerifySentCodeRepoImpl(gh<_i8.VerifySentCodeRepoDS>()));
    gh.factory<_i14.SignUpRepoDS>(
        () => _i15.SignUpRepoDSImpl(gh<_i3.SharedPrefsUtils>()));
    gh.factory<_i16.MainRepo>(() => _i17.MainRepoImpl(gh<_i4.MainRepoDS>()));
    gh.factory<_i18.GetAllCategoriesUseCase>(
        () => _i18.GetAllCategoriesUseCase(gh<_i16.MainRepo>()));
    gh.factory<_i19.GetAllProductsUseCase>(
        () => _i19.GetAllProductsUseCase(gh<_i16.MainRepo>()));
    gh.factory<_i20.GetAllBrandsUseCase>(
        () => _i20.GetAllBrandsUseCase(gh<_i16.MainRepo>()));
    gh.factory<_i21.GetProductsWithBrandIDUseCase>(
        () => _i21.GetProductsWithBrandIDUseCase(gh<_i16.MainRepo>()));
    gh.factory<_i22.GetProductsWithCategoryIDUseCase>(
        () => _i22.GetProductsWithCategoryIDUseCase(gh<_i16.MainRepo>()));
    gh.factory<_i23.GetWishListUseCase>(
        () => _i23.GetWishListUseCase(gh<_i16.MainRepo>()));
    gh.factory<_i24.AddToWishListUseCase>(
        () => _i24.AddToWishListUseCase(gh<_i16.MainRepo>()));
    gh.factory<_i25.RemoveFromWishListUseCase>(
        () => _i25.RemoveFromWishListUseCase(gh<_i16.MainRepo>()));
    gh.factory<_i26.SignInRepoDS>(
        () => _i27.SignInRepoDSImpl(gh<_i3.SharedPrefsUtils>()));
    gh.factory<_i28.SignUpRepo>(
        () => _i29.SignUpRepoImpl(gh<_i14.SignUpRepoDS>()));
    gh.factory<_i30.VerifyEmailRepo>(
        () => _i31.VerifyEmailRepoImpl(gh<_i6.VerifyEmailRepoDS>()));
    gh.factory<_i32.ResetPasswordRepo>(
        () => _i33.RestPasswordRepoImpl(gh<_i10.ResetPasswordRepoDS>()));
    gh.factory<_i34.SignInRepo>(
        () => _i35.SignInRepoImpl(gh<_i26.SignInRepoDS>()));
    gh.factory<_i36.VerifySentCodeUseCase>(
        () => _i36.VerifySentCodeUseCase(gh<_i12.VerifySentCodeRepo>()));
    gh.factory<_i37.SignInUseCase>(
        () => _i37.SignInUseCase(gh<_i34.SignInRepo>()));
    gh.factory<_i38.ResetPasswordUseCase>(
        () => _i38.ResetPasswordUseCase(gh<_i32.ResetPasswordRepo>()));
    gh.factory<_i39.VerifyEmailUseCase>(
        () => _i39.VerifyEmailUseCase(gh<_i30.VerifyEmailRepo>()));
    gh.factory<_i40.MainViewModel>(() => _i40.MainViewModel(
          gh<_i18.GetAllCategoriesUseCase>(),
          gh<_i19.GetAllProductsUseCase>(),
          gh<_i20.GetAllBrandsUseCase>(),
          gh<_i21.GetProductsWithBrandIDUseCase>(),
          gh<_i22.GetProductsWithCategoryIDUseCase>(),
          gh<_i23.GetWishListUseCase>(),
          gh<_i24.AddToWishListUseCase>(),
          gh<_i25.RemoveFromWishListUseCase>(),
        ));
    gh.factory<_i41.SignUpUseCase>(
        () => _i41.SignUpUseCase(gh<_i28.SignUpRepo>()));
    gh.factory<_i42.SignInViewModel>(
        () => _i42.SignInViewModel(gh<_i37.SignInUseCase>()));
    gh.factory<_i43.ResetPasswordViewModel>(
        () => _i43.ResetPasswordViewModel(gh<_i38.ResetPasswordUseCase>()));
    gh.factory<_i44.VerifySentCodeViewModel>(() => _i44.VerifySentCodeViewModel(
          gh<_i39.VerifyEmailUseCase>(),
          gh<_i36.VerifySentCodeUseCase>(),
        ));
    gh.factory<_i45.SignUpViewModel>(
        () => _i45.SignUpViewModel(gh<_i41.SignUpUseCase>()));
    gh.factory<_i46.VerifyEmailViewModel>(
        () => _i46.VerifyEmailViewModel(gh<_i39.VerifyEmailUseCase>()));
    return this;
  }
}
