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
    as _i22;
import '../../data/repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo_ds_impl.dart'
    as _i16;
import '../../data/repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo_impl.dart'
    as _i54;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo_ds_impl.dart'
    as _i10;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo_impl.dart'
    as _i52;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_sent_code_reo/verify_sent_code_repo_ds_impl.dart'
    as _i14;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_sent_code_reo/verify_sent_code_repo_impl.dart'
    as _i26;
import '../../data/repos/authentication_repos/sign_in_repo/sign_in_repo_ds_impl.dart'
    as _i46;
import '../../data/repos/authentication_repos/sign_in_repo/sign_in_repo_impl.dart'
    as _i57;
import '../../data/repos/authentication_repos/sign_up_repo/sign_up_repo_ds_impl.dart'
    as _i30;
import '../../data/repos/authentication_repos/sign_up_repo/sign_up_repo_impl.dart'
    as _i50;
import '../../data/repos/cart_repos/cart_repo_ds_impl.dart' as _i48;
import '../../data/repos/cart_repos/cart_repo_impl.dart' as _i61;
import '../../data/repos/get_specific_product_repos/get_specific_product_repo_ds_impl.dart'
    as _i18;
import '../../data/repos/get_specific_product_repos/get_specific_product_repo_impl.dart'
    as _i28;
import '../../data/repos/main_repos/main_repo_ds_impl.dart' as _i8;
import '../../data/repos/main_repos/main_repo_impl.dart' as _i32;
import '../../data/repos/user_addresses_repos/user_addresses_repo_ds_impl.dart'
    as _i20;
import '../../data/repos/user_addresses_repos/user_addresses_repo_impl.dart'
    as _i24;
import '../../data/utils/shared_prefs_utils.dart' as _i3;
import '../../ui/screens/all_products/all_products_view_model.dart' as _i4;
import '../../ui/screens/authentication/forgot_password/reset_password/reset_password_view_model.dart'
    as _i74;
import '../../ui/screens/authentication/forgot_password/verify_email/verify_email_view_model.dart'
    as _i78;
import '../../ui/screens/authentication/forgot_password/verify_sent_code/verify_sent_code_view_model.dart'
    as _i76;
import '../../ui/screens/authentication/sign_in/sign_in_view_model.dart'
    as _i69;
import '../../ui/screens/authentication/sign_up/sign_up_view_model.dart'
    as _i77;
import '../../ui/screens/cart/cart_view_model.dart' as _i79;
import '../../ui/screens/main/main_view_model.dart' as _i75;
import '../../ui/screens/main/tabs/profile/profile_tab_view_model.dart' as _i5;
import '../../ui/screens/main/tabs/profile/tabs/addresses/addresses_view_model.dart'
    as _i65;
import '../../ui/screens/main/tabs/profile/tabs/edit_profile/edit_profile_tab_view_model.dart'
    as _i67;
import '../../ui/screens/product_details/product_details_view_model.dart'
    as _i66;
import '../../ui/screens/products_of_category/products_of_category_view_model.dart'
    as _i6;
import '../repos/authentication_repos/edit_profile_repo/edit_profile_repo.dart'
    as _i21;
import '../repos/authentication_repos/edit_profile_repo/edit_profile_repo_ds.dart'
    as _i11;
import '../repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo.dart'
    as _i53;
import '../repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo_ds.dart'
    as _i15;
import '../repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo.dart'
    as _i51;
import '../repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo_ds.dart'
    as _i9;
import '../repos/authentication_repos/forgot_password_repos/verify_sent_code_repo/verify_sent_code_repo.dart'
    as _i25;
import '../repos/authentication_repos/forgot_password_repos/verify_sent_code_repo/verify_sent_code_repo_ds.dart'
    as _i13;
import '../repos/authentication_repos/sign_in_repo/sign_in_repo.dart' as _i56;
import '../repos/authentication_repos/sign_in_repo/sign_in_repo_ds.dart'
    as _i45;
import '../repos/authentication_repos/sign_up_repo/sign_up_repo.dart' as _i49;
import '../repos/authentication_repos/sign_up_repo/sign_up_repo_ds.dart'
    as _i29;
import '../repos/cart_repos/cart_repo.dart' as _i60;
import '../repos/cart_repos/cart_repo_ds.dart' as _i47;
import '../repos/get_specific_product_repos/get_specific_product_repo.dart'
    as _i27;
import '../repos/get_specific_product_repos/get_specific_product_repo_ds.dart'
    as _i17;
import '../repos/main_repos/main_repo.dart' as _i31;
import '../repos/main_repos/main_repo_ds.dart' as _i7;
import '../repos/user_addresses_repos/user_addresses_repo.dart' as _i23;
import '../repos/user_addresses_repos/user_addresses_repo_ds.dart' as _i19;
import '../use_cases/addresses_use_cases/add_new_address_use_case.dart' as _i42;
import '../use_cases/addresses_use_cases/delete_user_address_use_case.dart'
    as _i43;
import '../use_cases/addresses_use_cases/get_user_addresses_use_case.dart'
    as _i44;
import '../use_cases/authentication_use_cases/edit_profile_use_case.dart'
    as _i62;
import '../use_cases/authentication_use_cases/forgot_password_use_cases/reset_password_use_case.dart'
    as _i63;
import '../use_cases/authentication_use_cases/forgot_password_use_cases/verify_email_use_case.dart'
    as _i64;
import '../use_cases/authentication_use_cases/forgot_password_use_cases/verify_sent_code_use_case.dart'
    as _i58;
import '../use_cases/authentication_use_cases/sign_in_use_case.dart' as _i59;
import '../use_cases/authentication_use_cases/sign_up_use_case.dart' as _i68;
import '../use_cases/cart_use_cases/add_to_cart_use_case.dart' as _i70;
import '../use_cases/cart_use_cases/get_cart_use_case.dart' as _i71;
import '../use_cases/cart_use_cases/remove_from_cart_use_case.dart' as _i72;
import '../use_cases/cart_use_cases/update_product_in_cart_use_case.dart'
    as _i73;
import '../use_cases/get_specific_product_use_case/get_specific_product_use_case.dart'
    as _i55;
import '../use_cases/main_use_cases/add_to_wish_list_use_case.dart' as _i33;
import '../use_cases/main_use_cases/get_all_brands_use_case.dart' as _i34;
import '../use_cases/main_use_cases/get_all_categories_use_case.dart' as _i35;
import '../use_cases/main_use_cases/get_all_products_use_case.dart' as _i36;
import '../use_cases/main_use_cases/get_all_products_with_filtration_use_case.dart'
    as _i37;
import '../use_cases/main_use_cases/get_products_with_brand_id_use_case.dart'
    as _i38;
import '../use_cases/main_use_cases/get_products_with_category_id_use_case.dart'
    as _i39;
import '../use_cases/main_use_cases/get_wish_list_use_case.dart' as _i40;
import '../use_cases/main_use_cases/remove_from_wish_list_use_case.dart'
    as _i41;

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
    gh.factory<_i4.AllProductsViewModel>(() => _i4.AllProductsViewModel());
    gh.factory<_i5.ProfileTabViewModel>(() => _i5.ProfileTabViewModel());
    gh.factory<_i6.ProductsOfCategoryViewModel>(
        () => _i6.ProductsOfCategoryViewModel());
    gh.factory<_i7.MainRepoDS>(() => _i8.MainRepoDSImpl());
    gh.factory<_i9.VerifyEmailRepoDS>(() => _i10.VerifyEmailRepoDSImpl());
    gh.factory<_i11.EditProfileRepoDS>(() => _i12.EditProfileRpoDSImpl());
    gh.factory<_i13.VerifySentCodeRepoDS>(
        () => _i14.VerifySentCodeRepoDSImpl());
    gh.factory<_i15.ResetPasswordRepoDS>(() => _i16.ResetPasswordRepoDSImpl());
    gh.factory<_i17.GetSpecificProductRepoDS>(
        () => _i18.GetSpecificProductRepoDSImpl());
    gh.factory<_i19.UserAddressesRepoDS>(() => _i20.UserAddressesRepoDSImpl());
    gh.factory<_i21.EditProfileRepo>(
        () => _i22.EditProfileRepoImpl(gh<_i11.EditProfileRepoDS>()));
    gh.factory<_i23.UserAddressesRepo>(
        () => _i24.UserAddressesRepoImpl(gh<_i19.UserAddressesRepoDS>()));
    gh.factory<_i25.VerifySentCodeRepo>(
        () => _i26.VerifySentCodeRepoImpl(gh<_i13.VerifySentCodeRepoDS>()));
    gh.factory<_i27.GetSpecificProductRepo>(() =>
        _i28.GetSpecificProductRepoImpl(gh<_i17.GetSpecificProductRepoDS>()));
    gh.factory<_i29.SignUpRepoDS>(
        () => _i30.SignUpRepoDSImpl(gh<_i3.SharedPrefsUtils>()));
    gh.factory<_i31.MainRepo>(() => _i32.MainRepoImpl(gh<_i7.MainRepoDS>()));
    gh.factory<_i33.AddToWishListUseCase>(
        () => _i33.AddToWishListUseCase(gh<_i31.MainRepo>()));
    gh.factory<_i34.GetAllBrandsUseCase>(
        () => _i34.GetAllBrandsUseCase(gh<_i31.MainRepo>()));
    gh.factory<_i35.GetAllCategoriesUseCase>(
        () => _i35.GetAllCategoriesUseCase(gh<_i31.MainRepo>()));
    gh.factory<_i36.GetAllProductsUseCase>(
        () => _i36.GetAllProductsUseCase(gh<_i31.MainRepo>()));
    gh.factory<_i37.GetAllProductsWithFiltrationUseCase>(
        () => _i37.GetAllProductsWithFiltrationUseCase(gh<_i31.MainRepo>()));
    gh.factory<_i38.GetProductsWithBrandIDUseCase>(
        () => _i38.GetProductsWithBrandIDUseCase(gh<_i31.MainRepo>()));
    gh.factory<_i39.GetProductsWithCategoryIDUseCase>(
        () => _i39.GetProductsWithCategoryIDUseCase(gh<_i31.MainRepo>()));
    gh.factory<_i40.GetWishListUseCase>(
        () => _i40.GetWishListUseCase(gh<_i31.MainRepo>()));
    gh.factory<_i41.RemoveFromWishListUseCase>(
        () => _i41.RemoveFromWishListUseCase(gh<_i31.MainRepo>()));
    gh.factory<_i42.AddUserAddressUseCase>(
        () => _i42.AddUserAddressUseCase(gh<_i23.UserAddressesRepo>()));
    gh.factory<_i43.DeleteUserAddressesUseCase>(
        () => _i43.DeleteUserAddressesUseCase(gh<_i23.UserAddressesRepo>()));
    gh.factory<_i44.GetUserAddressesUseCase>(
        () => _i44.GetUserAddressesUseCase(gh<_i23.UserAddressesRepo>()));
    gh.factory<_i45.SignInRepoDS>(
        () => _i46.SignInRepoDSImpl(gh<_i3.SharedPrefsUtils>()));
    gh.factory<_i47.CartRepoDS>(
        () => _i48.CartRepoDSImpl(gh<_i3.SharedPrefsUtils>()));
    gh.factory<_i49.SignUpRepo>(
        () => _i50.SignUpRepoImpl(gh<_i29.SignUpRepoDS>()));
    gh.factory<_i51.VerifyEmailRepo>(
        () => _i52.VerifyEmailRepoImpl(gh<_i9.VerifyEmailRepoDS>()));
    gh.factory<_i53.ResetPasswordRepo>(
        () => _i54.RestPasswordRepoImpl(gh<_i15.ResetPasswordRepoDS>()));
    gh.factory<_i55.GetSpecificProductUseCase>(() =>
        _i55.GetSpecificProductUseCase(gh<_i27.GetSpecificProductRepo>()));
    gh.factory<_i56.SignInRepo>(
        () => _i57.SignInRepoImpl(gh<_i45.SignInRepoDS>()));
    gh.factory<_i58.VerifySentCodeUseCase>(
        () => _i58.VerifySentCodeUseCase(gh<_i25.VerifySentCodeRepo>()));
    gh.factory<_i59.SignInUseCase>(
        () => _i59.SignInUseCase(gh<_i56.SignInRepo>()));
    gh.factory<_i60.CartRepo>(() => _i61.CartRepoImpl(gh<_i47.CartRepoDS>()));
    gh.factory<_i62.EditProfileUseCase>(
        () => _i62.EditProfileUseCase(gh<_i21.EditProfileRepo>()));
    gh.factory<_i63.ResetPasswordUseCase>(
        () => _i63.ResetPasswordUseCase(gh<_i53.ResetPasswordRepo>()));
    gh.factory<_i64.VerifyEmailUseCase>(
        () => _i64.VerifyEmailUseCase(gh<_i51.VerifyEmailRepo>()));
    gh.factory<_i65.AddressesViewModel>(() => _i65.AddressesViewModel(
          gh<_i44.GetUserAddressesUseCase>(),
          gh<_i43.DeleteUserAddressesUseCase>(),
          gh<_i42.AddUserAddressUseCase>(),
        ));
    gh.factory<_i66.ProductDetailsViewModel>(() =>
        _i66.ProductDetailsViewModel(gh<_i55.GetSpecificProductUseCase>()));
    gh.factory<_i67.EditProfileTabViewModel>(
        () => _i67.EditProfileTabViewModel(gh<_i62.EditProfileUseCase>()));
    gh.factory<_i68.SignUpUseCase>(
        () => _i68.SignUpUseCase(gh<_i49.SignUpRepo>()));
    gh.factory<_i69.SignInViewModel>(
        () => _i69.SignInViewModel(gh<_i59.SignInUseCase>()));
    gh.factory<_i70.AddToCartUseCase>(
        () => _i70.AddToCartUseCase(gh<_i60.CartRepo>()));
    gh.factory<_i71.GetCartUseCase>(
        () => _i71.GetCartUseCase(gh<_i60.CartRepo>()));
    gh.factory<_i72.RemoveFromCartUseCase>(
        () => _i72.RemoveFromCartUseCase(gh<_i60.CartRepo>()));
    gh.factory<_i73.UpdateProductInCartUseCase>(
        () => _i73.UpdateProductInCartUseCase(gh<_i60.CartRepo>()));
    gh.factory<_i74.ResetPasswordViewModel>(
        () => _i74.ResetPasswordViewModel(gh<_i63.ResetPasswordUseCase>()));
    gh.factory<_i75.MainViewModel>(() => _i75.MainViewModel(
          gh<_i35.GetAllCategoriesUseCase>(),
          gh<_i36.GetAllProductsUseCase>(),
          gh<_i34.GetAllBrandsUseCase>(),
          gh<_i38.GetProductsWithBrandIDUseCase>(),
          gh<_i39.GetProductsWithCategoryIDUseCase>(),
          gh<_i40.GetWishListUseCase>(),
          gh<_i33.AddToWishListUseCase>(),
          gh<_i41.RemoveFromWishListUseCase>(),
          gh<_i37.GetAllProductsWithFiltrationUseCase>(),
          gh<_i71.GetCartUseCase>(),
          gh<_i70.AddToCartUseCase>(),
          gh<_i72.RemoveFromCartUseCase>(),
          gh<_i73.UpdateProductInCartUseCase>(),
        ));
    gh.factory<_i76.VerifySentCodeViewModel>(() => _i76.VerifySentCodeViewModel(
          gh<_i64.VerifyEmailUseCase>(),
          gh<_i58.VerifySentCodeUseCase>(),
        ));
    gh.factory<_i77.SignUpViewModel>(
        () => _i77.SignUpViewModel(gh<_i68.SignUpUseCase>()));
    gh.factory<_i78.VerifyEmailViewModel>(
        () => _i78.VerifyEmailViewModel(gh<_i64.VerifyEmailUseCase>()));
    gh.factory<_i79.CartViewModel>(
        () => _i79.CartViewModel(gh<_i73.UpdateProductInCartUseCase>()));
    return this;
  }
}
