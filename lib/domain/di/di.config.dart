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
    as _i12;
import '../../data/repos/authentication_repos/ediit_profile_repo/edit_profile_repo_impl.dart'
    as _i20;
import '../../data/repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo_ds_impl.dart'
    as _i16;
import '../../data/repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo_impl.dart'
    as _i45;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo_ds_impl.dart'
    as _i10;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo_impl.dart'
    as _i43;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_sent_code_reo/verify_sent_code_repo_ds_impl.dart'
    as _i14;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_sent_code_reo/verify_sent_code_repo_impl.dart'
    as _i22;
import '../../data/repos/authentication_repos/sign_in_repo/sign_in_repo_ds_impl.dart'
    as _i39;
import '../../data/repos/authentication_repos/sign_in_repo/sign_in_repo_impl.dart'
    as _i48;
import '../../data/repos/authentication_repos/sign_up_repo/sign_up_repo_ds_impl.dart'
    as _i26;
import '../../data/repos/authentication_repos/sign_up_repo/sign_up_repo_impl.dart'
    as _i41;
import '../../data/repos/get_specific_product_repos/get_specific_product_repo_ds_impl.dart'
    as _i18;
import '../../data/repos/get_specific_product_repos/get_specific_product_repo_impl.dart'
    as _i24;
import '../../data/repos/main_repos/main_repo_ds_impl.dart' as _i8;
import '../../data/repos/main_repos/main_repo_impl.dart' as _i28;
import '../../data/utils/shared_prefs_utils.dart' as _i3;
import '../../ui/screens/all_products/all_products_view_model.dart' as _i6;
import '../../ui/screens/authentication/forgot_password/reset_password/reset_password_view_model.dart'
    as _i59;
import '../../ui/screens/authentication/forgot_password/verify_email/verify_email_view_model.dart'
    as _i62;
import '../../ui/screens/authentication/forgot_password/verify_sent_code/verify_sent_code_view_model.dart'
    as _i60;
import '../../ui/screens/authentication/sign_in/sign_in_view_model.dart'
    as _i58;
import '../../ui/screens/authentication/sign_up/sign_up_view_model.dart'
    as _i61;
import '../../ui/screens/main/main_view_model.dart' as _i49;
import '../../ui/screens/main/tabs/profile/profile_tab_view_model.dart' as _i4;
import '../../ui/screens/main/tabs/profile/tabs/edit_profile/edit_profile_tab_view_model.dart'
    as _i56;
import '../../ui/screens/product_details/product_details_view_model.dart'
    as _i55;
import '../../ui/screens/products_of_category/prodducts_of_category_view_model.dart'
    as _i5;
import '../repos/authentication_repos/edit_profile_repo/edit_profile_repo.dart'
    as _i19;
import '../repos/authentication_repos/edit_profile_repo/edit_profile_repo_ds.dart'
    as _i11;
import '../repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo.dart'
    as _i44;
import '../repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo_ds.dart'
    as _i15;
import '../repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo.dart'
    as _i42;
import '../repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo_ds.dart'
    as _i9;
import '../repos/authentication_repos/forgot_password_repos/verify_sent_code_repo/verify_sent_code_repo.dart'
    as _i21;
import '../repos/authentication_repos/forgot_password_repos/verify_sent_code_repo/verify_sent_code_repo_ds.dart'
    as _i13;
import '../repos/authentication_repos/sign_in_repo/sign_in_repo.dart' as _i47;
import '../repos/authentication_repos/sign_in_repo/sign_in_repo_ds.dart'
    as _i38;
import '../repos/authentication_repos/sign_up_repo/sign_up_repo.dart' as _i40;
import '../repos/authentication_repos/sign_up_repo/sign_up_repo_ds.dart'
    as _i25;
import '../repos/get_specific_product_repos/get_specific_product_repo.dart'
    as _i23;
import '../repos/get_specific_product_repos/get_specific_product_repo_ds.dart'
    as _i17;
import '../repos/main_repos/main_repo.dart' as _i27;
import '../repos/main_repos/main_repo_ds.dart' as _i7;
import '../use_cases/authentication_use_cases/edit_profile_use_case.dart'
    as _i52;
import '../use_cases/authentication_use_cases/forgot_password_use_cases/reset_password_use_case.dart'
    as _i53;
import '../use_cases/authentication_use_cases/forgot_password_use_cases/verify_email_use_case.dart'
    as _i54;
import '../use_cases/authentication_use_cases/forgot_password_use_cases/verify_sent_code_use_case.dart'
    as _i50;
import '../use_cases/authentication_use_cases/sign_in_use_case.dart' as _i51;
import '../use_cases/authentication_use_cases/sign_up_use_case.dart' as _i57;
import '../use_cases/get_specific_product_use_case/get_specific_product_use_case.dart'
    as _i46;
import '../use_cases/main_use_cases/add_to_wish_list_use_case.dart' as _i29;
import '../use_cases/main_use_cases/get_all_brands_use_case.dart' as _i30;
import '../use_cases/main_use_cases/get_all_categories_use_case.dart' as _i31;
import '../use_cases/main_use_cases/get_all_products_use_case.dart' as _i32;
import '../use_cases/main_use_cases/get_all_products_with_filtration_use_case.dart'
    as _i37;
import '../use_cases/main_use_cases/get_products_with_brand_id_use_case.dart'
    as _i33;
import '../use_cases/main_use_cases/get_products_with_category_id_use_case.dart'
    as _i34;
import '../use_cases/main_use_cases/get_wish_list_use_case.dart' as _i35;
import '../use_cases/main_use_cases/remove_from_wish_list_use_case.dart'
    as _i36;

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
    gh.factory<_i6.AllProductsViewModel>(() => _i6.AllProductsViewModel());
    gh.factory<_i7.MainRepoDS>(() => _i8.MainRepoDSImpl());
    gh.factory<_i9.VerifyEmailRepoDS>(() => _i10.VerifyEmailRepoDSImpl());
    gh.factory<_i11.EditProfileRepoDS>(() => _i12.EditProfileRpoDSImpl());
    gh.factory<_i13.VerifySentCodeRepoDS>(
        () => _i14.VerifySentCodeRepoDSImpl());
    gh.factory<_i15.ResetPasswordRepoDS>(() => _i16.ResetPasswordRepoDSImpl());
    gh.factory<_i17.GetSpecificProductRepoDS>(
        () => _i18.GetSpecificProductRepoDSImpl());
    gh.factory<_i19.EditProfileRepo>(
        () => _i20.EditProfileRepoImpl(gh<_i11.EditProfileRepoDS>()));
    gh.factory<_i21.VerifySentCodeRepo>(
        () => _i22.VerifySentCodeRepoImpl(gh<_i13.VerifySentCodeRepoDS>()));
    gh.factory<_i23.GetSpecificProductRepo>(() =>
        _i24.GetSpecificProductRepoImpl(gh<_i17.GetSpecificProductRepoDS>()));
    gh.factory<_i25.SignUpRepoDS>(
        () => _i26.SignUpRepoDSImpl(gh<_i3.SharedPrefsUtils>()));
    gh.factory<_i27.MainRepo>(() => _i28.MainRepoImpl(gh<_i7.MainRepoDS>()));
    gh.factory<_i29.AddToWishListUseCase>(
        () => _i29.AddToWishListUseCase(gh<_i27.MainRepo>()));
    gh.factory<_i30.GetAllBrandsUseCase>(
        () => _i30.GetAllBrandsUseCase(gh<_i27.MainRepo>()));
    gh.factory<_i31.GetAllCategoriesUseCase>(
        () => _i31.GetAllCategoriesUseCase(gh<_i27.MainRepo>()));
    gh.factory<_i32.GetAllProductsUseCase>(
        () => _i32.GetAllProductsUseCase(gh<_i27.MainRepo>()));
    gh.factory<_i33.GetProductsWithBrandIDUseCase>(
        () => _i33.GetProductsWithBrandIDUseCase(gh<_i27.MainRepo>()));
    gh.factory<_i34.GetProductsWithCategoryIDUseCase>(
        () => _i34.GetProductsWithCategoryIDUseCase(gh<_i27.MainRepo>()));
    gh.factory<_i35.GetWishListUseCase>(
        () => _i35.GetWishListUseCase(gh<_i27.MainRepo>()));
    gh.factory<_i36.RemoveFromWishListUseCase>(
        () => _i36.RemoveFromWishListUseCase(gh<_i27.MainRepo>()));
    gh.factory<_i37.GetAllProductsWithFiltrationUseCase>(
        () => _i37.GetAllProductsWithFiltrationUseCase(gh<_i27.MainRepo>()));
    gh.factory<_i38.SignInRepoDS>(
        () => _i39.SignInRepoDSImpl(gh<_i3.SharedPrefsUtils>()));
    gh.factory<_i40.SignUpRepo>(
        () => _i41.SignUpRepoImpl(gh<_i25.SignUpRepoDS>()));
    gh.factory<_i42.VerifyEmailRepo>(
        () => _i43.VerifyEmailRepoImpl(gh<_i9.VerifyEmailRepoDS>()));
    gh.factory<_i44.ResetPasswordRepo>(
        () => _i45.RestPasswordRepoImpl(gh<_i15.ResetPasswordRepoDS>()));
    gh.factory<_i46.GetSpecificProductUseCase>(() =>
        _i46.GetSpecificProductUseCase(gh<_i23.GetSpecificProductRepo>()));
    gh.factory<_i47.SignInRepo>(
        () => _i48.SignInRepoImpl(gh<_i38.SignInRepoDS>()));
    gh.factory<_i49.MainViewModel>(() => _i49.MainViewModel(
          gh<_i31.GetAllCategoriesUseCase>(),
          gh<_i32.GetAllProductsUseCase>(),
          gh<_i30.GetAllBrandsUseCase>(),
          gh<_i33.GetProductsWithBrandIDUseCase>(),
          gh<_i34.GetProductsWithCategoryIDUseCase>(),
          gh<_i35.GetWishListUseCase>(),
          gh<_i29.AddToWishListUseCase>(),
          gh<_i36.RemoveFromWishListUseCase>(),
          gh<_i37.GetAllProductsWithFiltrationUseCase>(),
        ));
    gh.factory<_i50.VerifySentCodeUseCase>(
        () => _i50.VerifySentCodeUseCase(gh<_i21.VerifySentCodeRepo>()));
    gh.factory<_i51.SignInUseCase>(
        () => _i51.SignInUseCase(gh<_i47.SignInRepo>()));
    gh.factory<_i52.EditProfileUseCase>(
        () => _i52.EditProfileUseCase(gh<_i19.EditProfileRepo>()));
    gh.factory<_i53.ResetPasswordUseCase>(
        () => _i53.ResetPasswordUseCase(gh<_i44.ResetPasswordRepo>()));
    gh.factory<_i54.VerifyEmailUseCase>(
        () => _i54.VerifyEmailUseCase(gh<_i42.VerifyEmailRepo>()));
    gh.factory<_i55.ProductDetailsViewModel>(() =>
        _i55.ProductDetailsViewModel(gh<_i46.GetSpecificProductUseCase>()));
    gh.factory<_i56.EditProfileTabViewModel>(
        () => _i56.EditProfileTabViewModel(gh<_i52.EditProfileUseCase>()));
    gh.factory<_i57.SignUpUseCase>(
        () => _i57.SignUpUseCase(gh<_i40.SignUpRepo>()));
    gh.factory<_i58.SignInViewModel>(
        () => _i58.SignInViewModel(gh<_i51.SignInUseCase>()));
    gh.factory<_i59.ResetPasswordViewModel>(
        () => _i59.ResetPasswordViewModel(gh<_i53.ResetPasswordUseCase>()));
    gh.factory<_i60.VerifySentCodeViewModel>(() => _i60.VerifySentCodeViewModel(
          gh<_i54.VerifyEmailUseCase>(),
          gh<_i50.VerifySentCodeUseCase>(),
        ));
    gh.factory<_i61.SignUpViewModel>(
        () => _i61.SignUpViewModel(gh<_i57.SignUpUseCase>()));
    gh.factory<_i62.VerifyEmailViewModel>(
        () => _i62.VerifyEmailViewModel(gh<_i54.VerifyEmailUseCase>()));
    return this;
  }
}
