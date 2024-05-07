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
    as _i11;
import '../../data/repos/authentication_repos/ediit_profile_repo/edit_profile_repo_impl.dart'
    as _i19;
import '../../data/repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo_ds_impl.dart'
    as _i15;
import '../../data/repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo_impl.dart'
    as _i43;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo_ds_impl.dart'
    as _i9;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo_impl.dart'
    as _i41;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_sent_code_reo/verify_sent_code_repo_ds_impl.dart'
    as _i13;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_sent_code_reo/verify_sent_code_repo_impl.dart'
    as _i21;
import '../../data/repos/authentication_repos/sign_in_repo/sign_in_repo_ds_impl.dart'
    as _i37;
import '../../data/repos/authentication_repos/sign_in_repo/sign_in_repo_impl.dart'
    as _i46;
import '../../data/repos/authentication_repos/sign_up_repo/sign_up_repo_ds_impl.dart'
    as _i25;
import '../../data/repos/authentication_repos/sign_up_repo/sign_up_repo_impl.dart'
    as _i39;
import '../../data/repos/get_specific_product_repos/get_specific_product_repo_ds_impl.dart'
    as _i17;
import '../../data/repos/get_specific_product_repos/get_specific_product_repo_impl.dart'
    as _i23;
import '../../data/repos/main_repos/main_repo_ds_impl.dart' as _i7;
import '../../data/repos/main_repos/main_repo_impl.dart' as _i27;
import '../../data/utils/shared_prefs_utils.dart' as _i3;
import '../../ui/screens/authentication/forgot_password/reset_password/reset_password_view_model.dart'
    as _i57;
import '../../ui/screens/authentication/forgot_password/verify_email/verify_email_view_model.dart'
    as _i60;
import '../../ui/screens/authentication/forgot_password/verify_sent_code/verify_sent_code_view_model.dart'
    as _i58;
import '../../ui/screens/authentication/sign_in/sign_in_view_model.dart'
    as _i56;
import '../../ui/screens/authentication/sign_up/sign_up_view_model.dart'
    as _i59;
import '../../ui/screens/main/main_view_model.dart' as _i52;
import '../../ui/screens/main/tabs/profile/profile_tab_view_model.dart' as _i4;
import '../../ui/screens/main/tabs/profile/tabs/edit_profile/edit_profile_tab_view_model.dart'
    as _i54;
import '../../ui/screens/product_details/product_details_view_model.dart'
    as _i53;
import '../../ui/screens/products_of_category/prodducts_of_category_view_model.dart'
    as _i5;
import '../repos/authentication_repos/edit_profile_repo/edit_profile_repo.dart'
    as _i18;
import '../repos/authentication_repos/edit_profile_repo/edit_profile_repo_ds.dart'
    as _i10;
import '../repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo.dart'
    as _i42;
import '../repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo_ds.dart'
    as _i14;
import '../repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo.dart'
    as _i40;
import '../repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo_ds.dart'
    as _i8;
import '../repos/authentication_repos/forgot_password_repos/verify_sent_code_repo/verify_sent_code_repo.dart'
    as _i20;
import '../repos/authentication_repos/forgot_password_repos/verify_sent_code_repo/verify_sent_code_repo_ds.dart'
    as _i12;
import '../repos/authentication_repos/sign_in_repo/sign_in_repo.dart' as _i45;
import '../repos/authentication_repos/sign_in_repo/sign_in_repo_ds.dart'
    as _i36;
import '../repos/authentication_repos/sign_up_repo/sign_up_repo.dart' as _i38;
import '../repos/authentication_repos/sign_up_repo/sign_up_repo_ds.dart'
    as _i24;
import '../repos/get_specific_product_repos/get_specific_product_repo.dart'
    as _i22;
import '../repos/get_specific_product_repos/get_specific_product_repo_ds.dart'
    as _i16;
import '../repos/main_repos/main_repo.dart' as _i26;
import '../repos/main_repos/main_repo_ds.dart' as _i6;
import '../use_cases/authentication_use_cases/edit_profile_use_case.dart'
    as _i49;
import '../use_cases/authentication_use_cases/forgot_password_use_cases/reset_password_use_case.dart'
    as _i50;
import '../use_cases/authentication_use_cases/forgot_password_use_cases/verify_email_use_case.dart'
    as _i51;
import '../use_cases/authentication_use_cases/forgot_password_use_cases/verify_sent_code_use_case.dart'
    as _i47;
import '../use_cases/authentication_use_cases/sign_in_use_case.dart' as _i48;
import '../use_cases/authentication_use_cases/sign_up_use_case.dart' as _i55;
import '../use_cases/get_specific_product_use_case/get_specific_product_use_case.dart'
    as _i44;
import '../use_cases/main_use_cases/add_to_wish_list_use_case.dart' as _i28;
import '../use_cases/main_use_cases/get_all_brands_use_case.dart' as _i29;
import '../use_cases/main_use_cases/get_all_categories_use_case.dart' as _i30;
import '../use_cases/main_use_cases/get_all_products_use_case.dart' as _i31;
import '../use_cases/main_use_cases/get_products_with_brand_id_use_case.dart'
    as _i32;
import '../use_cases/main_use_cases/get_products_with_category_id_use_case.dart'
    as _i33;
import '../use_cases/main_use_cases/get_wish_list_use_case.dart' as _i34;
import '../use_cases/main_use_cases/remove_from_wish_list_use_case.dart'
    as _i35;

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
    gh.factory<_i5.ProductsOfCategoryViewModel>(
        () => _i5.ProductsOfCategoryViewModel());
    gh.factory<_i6.MainRepoDS>(() => _i7.MainRepoDSImpl());
    gh.factory<_i8.VerifyEmailRepoDS>(() => _i9.VerifyEmailRepoDSImpl());
    gh.factory<_i10.EditProfileRepoDS>(() => _i11.EditProfileRpoDSImpl());
    gh.factory<_i12.VerifySentCodeRepoDS>(
        () => _i13.VerifySentCodeRepoDSImpl());
    gh.factory<_i14.ResetPasswordRepoDS>(() => _i15.ResetPasswordRepoDSImpl());
    gh.factory<_i16.GetSpecificProductRepoDS>(
        () => _i17.GetSpecificProductRepoDSImpl());
    gh.factory<_i18.EditProfileRepo>(
        () => _i19.EditProfileRepoImpl(gh<_i10.EditProfileRepoDS>()));
    gh.factory<_i20.VerifySentCodeRepo>(
        () => _i21.VerifySentCodeRepoImpl(gh<_i12.VerifySentCodeRepoDS>()));
    gh.factory<_i22.GetSpecificProductRepo>(() =>
        _i23.GetSpecificProductRepoImpl(gh<_i16.GetSpecificProductRepoDS>()));
    gh.factory<_i24.SignUpRepoDS>(
        () => _i25.SignUpRepoDSImpl(gh<_i3.SharedPrefsUtils>()));
    gh.factory<_i26.MainRepo>(() => _i27.MainRepoImpl(gh<_i6.MainRepoDS>()));
    gh.factory<_i28.AddToWishListUseCase>(
        () => _i28.AddToWishListUseCase(gh<_i26.MainRepo>()));
    gh.factory<_i29.GetAllBrandsUseCase>(
        () => _i29.GetAllBrandsUseCase(gh<_i26.MainRepo>()));
    gh.factory<_i30.GetAllCategoriesUseCase>(
        () => _i30.GetAllCategoriesUseCase(gh<_i26.MainRepo>()));
    gh.factory<_i31.GetAllProductsUseCase>(
        () => _i31.GetAllProductsUseCase(gh<_i26.MainRepo>()));
    gh.factory<_i32.GetProductsWithBrandIDUseCase>(
        () => _i32.GetProductsWithBrandIDUseCase(gh<_i26.MainRepo>()));
    gh.factory<_i33.GetProductsWithCategoryIDUseCase>(
        () => _i33.GetProductsWithCategoryIDUseCase(gh<_i26.MainRepo>()));
    gh.factory<_i34.GetWishListUseCase>(
        () => _i34.GetWishListUseCase(gh<_i26.MainRepo>()));
    gh.factory<_i35.RemoveFromWishListUseCase>(
        () => _i35.RemoveFromWishListUseCase(gh<_i26.MainRepo>()));
    gh.factory<_i36.SignInRepoDS>(
        () => _i37.SignInRepoDSImpl(gh<_i3.SharedPrefsUtils>()));
    gh.factory<_i38.SignUpRepo>(
        () => _i39.SignUpRepoImpl(gh<_i24.SignUpRepoDS>()));
    gh.factory<_i40.VerifyEmailRepo>(
        () => _i41.VerifyEmailRepoImpl(gh<_i8.VerifyEmailRepoDS>()));
    gh.factory<_i42.ResetPasswordRepo>(
        () => _i43.RestPasswordRepoImpl(gh<_i14.ResetPasswordRepoDS>()));
    gh.factory<_i44.GetSpecificProductUseCase>(() =>
        _i44.GetSpecificProductUseCase(gh<_i22.GetSpecificProductRepo>()));
    gh.factory<_i45.SignInRepo>(
        () => _i46.SignInRepoImpl(gh<_i36.SignInRepoDS>()));
    gh.factory<_i47.VerifySentCodeUseCase>(
        () => _i47.VerifySentCodeUseCase(gh<_i20.VerifySentCodeRepo>()));
    gh.factory<_i48.SignInUseCase>(
        () => _i48.SignInUseCase(gh<_i45.SignInRepo>()));
    gh.factory<_i49.EditProfileUseCase>(
        () => _i49.EditProfileUseCase(gh<_i18.EditProfileRepo>()));
    gh.factory<_i50.ResetPasswordUseCase>(
        () => _i50.ResetPasswordUseCase(gh<_i42.ResetPasswordRepo>()));
    gh.factory<_i51.VerifyEmailUseCase>(
        () => _i51.VerifyEmailUseCase(gh<_i40.VerifyEmailRepo>()));
    gh.factory<_i52.MainViewModel>(() => _i52.MainViewModel(
          gh<_i30.GetAllCategoriesUseCase>(),
          gh<_i31.GetAllProductsUseCase>(),
          gh<_i29.GetAllBrandsUseCase>(),
          gh<_i32.GetProductsWithBrandIDUseCase>(),
          gh<_i33.GetProductsWithCategoryIDUseCase>(),
          gh<_i34.GetWishListUseCase>(),
          gh<_i28.AddToWishListUseCase>(),
          gh<_i35.RemoveFromWishListUseCase>(),
        ));
    gh.factory<_i53.ProductDetailsViewModel>(() =>
        _i53.ProductDetailsViewModel(gh<_i44.GetSpecificProductUseCase>()));
    gh.factory<_i54.EditProfileTabViewModel>(
        () => _i54.EditProfileTabViewModel(gh<_i49.EditProfileUseCase>()));
    gh.factory<_i55.SignUpUseCase>(
        () => _i55.SignUpUseCase(gh<_i38.SignUpRepo>()));
    gh.factory<_i56.SignInViewModel>(
        () => _i56.SignInViewModel(gh<_i48.SignInUseCase>()));
    gh.factory<_i57.ResetPasswordViewModel>(
        () => _i57.ResetPasswordViewModel(gh<_i50.ResetPasswordUseCase>()));
    gh.factory<_i58.VerifySentCodeViewModel>(() => _i58.VerifySentCodeViewModel(
          gh<_i51.VerifyEmailUseCase>(),
          gh<_i47.VerifySentCodeUseCase>(),
        ));
    gh.factory<_i59.SignUpViewModel>(
        () => _i59.SignUpViewModel(gh<_i55.SignUpUseCase>()));
    gh.factory<_i60.VerifyEmailViewModel>(
        () => _i60.VerifyEmailViewModel(gh<_i51.VerifyEmailUseCase>()));
    return this;
  }
}
