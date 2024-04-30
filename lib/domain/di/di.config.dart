// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/repos/authentication_repos/ediit_profile_repo/edit_profile_repo_ds_impl.dart'
    as _i10;
import '../../data/repos/authentication_repos/ediit_profile_repo/edit_profile_repo_impl.dart'
    as _i16;
import '../../data/repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo_ds_impl.dart'
    as _i14;
import '../../data/repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo_impl.dart'
    as _i38;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo_ds_impl.dart'
    as _i8;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo_impl.dart'
    as _i36;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_sent_code_reo/verify_sent_code_repo_ds_impl.dart'
    as _i12;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_sent_code_reo/verify_sent_code_repo_impl.dart'
    as _i18;
import '../../data/repos/authentication_repos/sign_in_repo/sign_in_repo_ds_impl.dart'
    as _i32;
import '../../data/repos/authentication_repos/sign_in_repo/sign_in_repo_impl.dart'
    as _i40;
import '../../data/repos/authentication_repos/sign_up_repo/sign_up_repo_ds_impl.dart'
    as _i20;
import '../../data/repos/authentication_repos/sign_up_repo/sign_up_repo_impl.dart'
    as _i34;
import '../../data/repos/main_repos/main_repo_ds_impl.dart' as _i6;
import '../../data/repos/main_repos/main_repo_impl.dart' as _i22;
import '../../data/utils/shared_prefs_utils.dart' as _i3;
import '../../ui/screens/authentication/forgot_password/reset_password/reset_password_view_model.dart'
    as _i50;
import '../../ui/screens/authentication/forgot_password/verify_email/verify_email_view_model.dart'
    as _i53;
import '../../ui/screens/authentication/forgot_password/verify_sent_code/verify_sent_code_view_model.dart'
    as _i51;
import '../../ui/screens/authentication/sign_in/sign_in_view_model.dart'
    as _i49;
import '../../ui/screens/authentication/sign_up/sign_up_view_model.dart'
    as _i52;
import '../../ui/screens/main/main_view_model.dart' as _i46;
import '../../ui/screens/main/tabs/profile/profile_tab_view_model.dart' as _i4;
import '../../ui/screens/main/tabs/profile/tabs/edit_profile/edit_profile_tab_view_model.dart'
    as _i47;
import '../repos/authentication_repos/edit_profile_repo/edit_profile_repo.dart'
    as _i15;
import '../repos/authentication_repos/edit_profile_repo/edit_profile_repo_ds.dart'
    as _i9;
import '../repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo.dart'
    as _i37;
import '../repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo_ds.dart'
    as _i13;
import '../repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo.dart'
    as _i35;
import '../repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo_ds.dart'
    as _i7;
import '../repos/authentication_repos/forgot_password_repos/verify_sent_code_repo/verify_sent_code_repo.dart'
    as _i17;
import '../repos/authentication_repos/forgot_password_repos/verify_sent_code_repo/verify_sent_code_repo_ds.dart'
    as _i11;
import '../repos/authentication_repos/sign_in_repo/sign_in_repo.dart' as _i39;
import '../repos/authentication_repos/sign_in_repo/sign_in_repo_ds.dart'
    as _i31;
import '../repos/authentication_repos/sign_up_repo/sign_up_repo.dart' as _i33;
import '../repos/authentication_repos/sign_up_repo/sign_up_repo_ds.dart'
    as _i19;
import '../repos/main_repos/main_repo.dart' as _i21;
import '../repos/main_repos/main_repo_ds.dart' as _i5;
import '../use_cases/authentication_use_cases/edit_profile_use_case.dart'
    as _i43;
import '../use_cases/authentication_use_cases/forgot_password_use_cases/reset_password_use_case.dart'
    as _i44;
import '../use_cases/authentication_use_cases/forgot_password_use_cases/verify_email_use_case.dart'
    as _i45;
import '../use_cases/authentication_use_cases/forgot_password_use_cases/verify_sent_code_use_case.dart'
    as _i41;
import '../use_cases/authentication_use_cases/sign_in_use_case.dart' as _i42;
import '../use_cases/authentication_use_cases/sign_up_use_case.dart' as _i48;
import '../use_cases/main_use_cases/add_to_wish_list_use_case.dart' as _i23;
import '../use_cases/main_use_cases/get_all_brands_use_case.dart' as _i24;
import '../use_cases/main_use_cases/get_all_categories_use_case.dart' as _i25;
import '../use_cases/main_use_cases/get_all_products_use_case.dart' as _i26;
import '../use_cases/main_use_cases/get_products_with_brand_id_use_case.dart'
    as _i27;
import '../use_cases/main_use_cases/get_products_with_category_id_use_case.dart'
    as _i28;
import '../use_cases/main_use_cases/get_wish_list_use_case.dart' as _i29;
import '../use_cases/main_use_cases/remove_from_wish_list_use_case.dart'
    as _i30;

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
    gh.factory<_i4.ProfileTabViewModel>(() => _i4.ProfileTabViewModel());
    gh.factory<_i5.MainRepoDS>(() => _i6.MainRepoDSImpl());
    gh.factory<_i7.VerifyEmailRepoDS>(() => _i8.VerifyEmailRepoDSImpl());
    gh.factory<_i9.EditProfileRepoDS>(() => _i10.EditProfileRpoDSImpl());
    gh.factory<_i11.VerifySentCodeRepoDS>(
        () => _i12.VerifySentCodeRepoDSImpl());
    gh.factory<_i13.ResetPasswordRepoDS>(() => _i14.ResetPasswordRepoDSImpl());
    gh.factory<_i15.EditProfileRepo>(
        () => _i16.EditProfileRepoImpl(gh<_i9.EditProfileRepoDS>()));
    gh.factory<_i17.VerifySentCodeRepo>(
        () => _i18.VerifySentCodeRepoImpl(gh<_i11.VerifySentCodeRepoDS>()));
    gh.factory<_i19.SignUpRepoDS>(
        () => _i20.SignUpRepoDSImpl(gh<_i3.SharedPrefsUtils>()));
    gh.factory<_i21.MainRepo>(() => _i22.MainRepoImpl(gh<_i5.MainRepoDS>()));
    gh.factory<_i23.AddToWishListUseCase>(
        () => _i23.AddToWishListUseCase(gh<_i21.MainRepo>()));
    gh.factory<_i24.GetAllBrandsUseCase>(
        () => _i24.GetAllBrandsUseCase(gh<_i21.MainRepo>()));
    gh.factory<_i25.GetAllCategoriesUseCase>(
        () => _i25.GetAllCategoriesUseCase(gh<_i21.MainRepo>()));
    gh.factory<_i26.GetAllProductsUseCase>(
        () => _i26.GetAllProductsUseCase(gh<_i21.MainRepo>()));
    gh.factory<_i27.GetProductsWithBrandIDUseCase>(
        () => _i27.GetProductsWithBrandIDUseCase(gh<_i21.MainRepo>()));
    gh.factory<_i28.GetProductsWithCategoryIDUseCase>(
        () => _i28.GetProductsWithCategoryIDUseCase(gh<_i21.MainRepo>()));
    gh.factory<_i29.GetWishListUseCase>(
        () => _i29.GetWishListUseCase(gh<_i21.MainRepo>()));
    gh.factory<_i30.RemoveFromWishListUseCase>(
        () => _i30.RemoveFromWishListUseCase(gh<_i21.MainRepo>()));
    gh.factory<_i31.SignInRepoDS>(
        () => _i32.SignInRepoDSImpl(gh<_i3.SharedPrefsUtils>()));
    gh.factory<_i33.SignUpRepo>(
        () => _i34.SignUpRepoImpl(gh<_i19.SignUpRepoDS>()));
    gh.factory<_i35.VerifyEmailRepo>(
        () => _i36.VerifyEmailRepoImpl(gh<_i7.VerifyEmailRepoDS>()));
    gh.factory<_i37.ResetPasswordRepo>(
        () => _i38.RestPasswordRepoImpl(gh<_i13.ResetPasswordRepoDS>()));
    gh.factory<_i39.SignInRepo>(
        () => _i40.SignInRepoImpl(gh<_i31.SignInRepoDS>()));
    gh.factory<_i41.VerifySentCodeUseCase>(
        () => _i41.VerifySentCodeUseCase(gh<_i17.VerifySentCodeRepo>()));
    gh.factory<_i42.SignInUseCase>(
        () => _i42.SignInUseCase(gh<_i39.SignInRepo>()));
    gh.factory<_i43.EditProfileUseCase>(
        () => _i43.EditProfileUseCase(gh<_i15.EditProfileRepo>()));
    gh.factory<_i44.ResetPasswordUseCase>(
        () => _i44.ResetPasswordUseCase(gh<_i37.ResetPasswordRepo>()));
    gh.factory<_i45.VerifyEmailUseCase>(
        () => _i45.VerifyEmailUseCase(gh<_i35.VerifyEmailRepo>()));
    gh.factory<_i46.MainViewModel>(() => _i46.MainViewModel(
          gh<_i25.GetAllCategoriesUseCase>(),
          gh<_i26.GetAllProductsUseCase>(),
          gh<_i24.GetAllBrandsUseCase>(),
          gh<_i27.GetProductsWithBrandIDUseCase>(),
          gh<_i28.GetProductsWithCategoryIDUseCase>(),
          gh<_i29.GetWishListUseCase>(),
          gh<_i23.AddToWishListUseCase>(),
          gh<_i30.RemoveFromWishListUseCase>(),
        ));
    gh.factory<_i47.EditProfileTabViewModel>(
        () => _i47.EditProfileTabViewModel(gh<_i43.EditProfileUseCase>()));
    gh.factory<_i48.SignUpUseCase>(
        () => _i48.SignUpUseCase(gh<_i33.SignUpRepo>()));
    gh.factory<_i49.SignInViewModel>(
        () => _i49.SignInViewModel(gh<_i42.SignInUseCase>()));
    gh.factory<_i50.ResetPasswordViewModel>(
        () => _i50.ResetPasswordViewModel(gh<_i44.ResetPasswordUseCase>()));
    gh.factory<_i51.VerifySentCodeViewModel>(() => _i51.VerifySentCodeViewModel(
          gh<_i45.VerifyEmailUseCase>(),
          gh<_i41.VerifySentCodeUseCase>(),
        ));
    gh.factory<_i52.SignUpViewModel>(
        () => _i52.SignUpViewModel(gh<_i48.SignUpUseCase>()));
    gh.factory<_i53.VerifyEmailViewModel>(
        () => _i53.VerifyEmailViewModel(gh<_i45.VerifyEmailUseCase>()));
    return this;
  }
}
