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
    as _i26;
import '../../data/repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo_ds_impl.dart'
    as _i18;
import '../../data/repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo_impl.dart'
    as _i56;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo_ds_impl.dart'
    as _i10;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo_impl.dart'
    as _i54;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_sent_code_reo/verify_sent_code_repo_ds_impl.dart'
    as _i14;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_sent_code_reo/verify_sent_code_repo_impl.dart'
    as _i30;
import '../../data/repos/authentication_repos/sign_in_repo/sign_in_repo_ds_impl.dart'
    as _i50;
import '../../data/repos/authentication_repos/sign_in_repo/sign_in_repo_impl.dart'
    as _i59;
import '../../data/repos/authentication_repos/sign_up_repo/sign_up_repo_ds_impl.dart'
    as _i34;
import '../../data/repos/authentication_repos/sign_up_repo/sign_up_repo_impl.dart'
    as _i52;
import '../../data/repos/cart_repos/cart_repo_ds_impl.dart' as _i16;
import '../../data/repos/cart_repos/cart_repo_impl.dart' as _i24;
import '../../data/repos/get_specific_product_repos/get_specific_product_repo_ds_impl.dart'
    as _i20;
import '../../data/repos/get_specific_product_repos/get_specific_product_repo_impl.dart'
    as _i32;
import '../../data/repos/main_repos/main_repo_ds_impl.dart' as _i8;
import '../../data/repos/main_repos/main_repo_impl.dart' as _i36;
import '../../data/repos/user_addresses_repos/user_addresses_repo_ds_impl.dart'
    as _i22;
import '../../data/repos/user_addresses_repos/user_addresses_repo_impl.dart'
    as _i28;
import '../../data/utils/shared_prefs_utils.dart' as _i3;
import '../../ui/screens/all_products/all_products_view_model.dart' as _i5;
import '../../ui/screens/authentication/forgot_password/reset_password/reset_password_view_model.dart'
    as _i76;
import '../../ui/screens/authentication/forgot_password/verify_email/verify_email_view_model.dart'
    as _i79;
import '../../ui/screens/authentication/forgot_password/verify_sent_code/verify_sent_code_view_model.dart'
    as _i77;
import '../../ui/screens/authentication/sign_in/sign_in_view_model.dart'
    as _i75;
import '../../ui/screens/authentication/sign_up/sign_up_view_model.dart'
    as _i78;
import '../../ui/screens/cart/cart_view_model.dart' as _i69;
import '../../ui/screens/main/main_view_model.dart' as _i64;
import '../../ui/screens/main/tabs/profile/profile_tab_view_model.dart' as _i4;
import '../../ui/screens/main/tabs/profile/tabs/addresses/addresses_view_model.dart'
    as _i71;
import '../../ui/screens/main/tabs/profile/tabs/edit_profile/edit_profile_tab_view_model.dart'
    as _i73;
import '../../ui/screens/product_details/product_details_view_model.dart'
    as _i72;
import '../../ui/screens/products_of_category/products_of_category_view_model.dart'
    as _i6;
import '../repos/authentication_repos/edit_profile_repo/edit_profile_repo.dart'
    as _i25;
import '../repos/authentication_repos/edit_profile_repo/edit_profile_repo_ds.dart'
    as _i11;
import '../repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo.dart'
    as _i55;
import '../repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo_ds.dart'
    as _i17;
import '../repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo.dart'
    as _i53;
import '../repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo_ds.dart'
    as _i9;
import '../repos/authentication_repos/forgot_password_repos/verify_sent_code_repo/verify_sent_code_repo.dart'
    as _i29;
import '../repos/authentication_repos/forgot_password_repos/verify_sent_code_repo/verify_sent_code_repo_ds.dart'
    as _i13;
import '../repos/authentication_repos/sign_in_repo/sign_in_repo.dart' as _i58;
import '../repos/authentication_repos/sign_in_repo/sign_in_repo_ds.dart'
    as _i49;
import '../repos/authentication_repos/sign_up_repo/sign_up_repo.dart' as _i51;
import '../repos/authentication_repos/sign_up_repo/sign_up_repo_ds.dart'
    as _i33;
import '../repos/cart_repos/cart_repo.dart' as _i23;
import '../repos/cart_repos/cart_repo_ds.dart' as _i15;
import '../repos/get_specific_product_repos/get_specific_product_repo.dart'
    as _i31;
import '../repos/get_specific_product_repos/get_specific_product_repo_ds.dart'
    as _i19;
import '../repos/main_repos/main_repo.dart' as _i35;
import '../repos/main_repos/main_repo_ds.dart' as _i7;
import '../repos/user_addresses_repos/user_addresses_repo.dart' as _i27;
import '../repos/user_addresses_repos/user_addresses_repo_ds.dart' as _i21;
import '../use_cases/addresses_use_cases/add_new_address_use_case.dart' as _i48;
import '../use_cases/addresses_use_cases/delete_user_address_use_case.dart'
    as _i47;
import '../use_cases/addresses_use_cases/get_user_addresses_use_case.dart'
    as _i46;
import '../use_cases/authentication_use_cases/edit_profile_use_case.dart'
    as _i67;
import '../use_cases/authentication_use_cases/forgot_password_use_cases/reset_password_use_case.dart'
    as _i68;
import '../use_cases/authentication_use_cases/forgot_password_use_cases/verify_email_use_case.dart'
    as _i70;
import '../use_cases/authentication_use_cases/forgot_password_use_cases/verify_sent_code_use_case.dart'
    as _i65;
import '../use_cases/authentication_use_cases/sign_in_use_case.dart' as _i66;
import '../use_cases/authentication_use_cases/sign_up_use_case.dart' as _i74;
import '../use_cases/cart_use_cases/add_to_cart_use_case.dart' as _i61;
import '../use_cases/cart_use_cases/get_cart_use_case.dart' as _i60;
import '../use_cases/cart_use_cases/remove_from_cart_use_case.dart' as _i62;
import '../use_cases/cart_use_cases/update_product_in_cart_use_case.dart'
    as _i63;
import '../use_cases/get_specific_product_use_case/get_specific_product_use_case.dart'
    as _i57;
import '../use_cases/main_use_cases/add_to_wish_list_use_case.dart' as _i37;
import '../use_cases/main_use_cases/get_all_brands_use_case.dart' as _i38;
import '../use_cases/main_use_cases/get_all_categories_use_case.dart' as _i39;
import '../use_cases/main_use_cases/get_all_products_use_case.dart' as _i40;
import '../use_cases/main_use_cases/get_all_products_with_filtration_use_case.dart'
    as _i45;
import '../use_cases/main_use_cases/get_products_with_brand_id_use_case.dart'
    as _i41;
import '../use_cases/main_use_cases/get_products_with_category_id_use_case.dart'
    as _i42;
import '../use_cases/main_use_cases/get_wish_list_use_case.dart' as _i43;
import '../use_cases/main_use_cases/remove_from_wish_list_use_case.dart'
    as _i44;

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
    gh.factory<_i5.AllProductsViewModel>(() => _i5.AllProductsViewModel());
    gh.factory<_i6.ProductsOfCategoryViewModel>(
        () => _i6.ProductsOfCategoryViewModel());
    gh.factory<_i7.MainRepoDS>(() => _i8.MainRepoDSImpl());
    gh.factory<_i9.VerifyEmailRepoDS>(() => _i10.VerifyEmailRepoDSImpl());
    gh.factory<_i11.EditProfileRepoDS>(() => _i12.EditProfileRpoDSImpl());
    gh.factory<_i13.VerifySentCodeRepoDS>(
        () => _i14.VerifySentCodeRepoDSImpl());
    gh.factory<_i15.CartRepoDS>(() => _i16.CartRepoDSImpl());
    gh.factory<_i17.ResetPasswordRepoDS>(() => _i18.ResetPasswordRepoDSImpl());
    gh.factory<_i19.GetSpecificProductRepoDS>(
        () => _i20.GetSpecificProductRepoDSImpl());
    gh.factory<_i21.UserAddressesRepoDS>(() => _i22.UserAddressesRepoDSImpl());
    gh.factory<_i23.CartRepo>(() => _i24.CartRepoImpl(gh<_i15.CartRepoDS>()));
    gh.factory<_i25.EditProfileRepo>(
        () => _i26.EditProfileRepoImpl(gh<_i11.EditProfileRepoDS>()));
    gh.factory<_i27.UserAddressesRepo>(
        () => _i28.UserAddressesRepoImpl(gh<_i21.UserAddressesRepoDS>()));
    gh.factory<_i29.VerifySentCodeRepo>(
        () => _i30.VerifySentCodeRepoImpl(gh<_i13.VerifySentCodeRepoDS>()));
    gh.factory<_i31.GetSpecificProductRepo>(() =>
        _i32.GetSpecificProductRepoImpl(gh<_i19.GetSpecificProductRepoDS>()));
    gh.factory<_i33.SignUpRepoDS>(
        () => _i34.SignUpRepoDSImpl(gh<_i3.SharedPrefsUtils>()));
    gh.factory<_i35.MainRepo>(() => _i36.MainRepoImpl(gh<_i7.MainRepoDS>()));
    gh.factory<_i37.AddToWishListUseCase>(
        () => _i37.AddToWishListUseCase(gh<_i35.MainRepo>()));
    gh.factory<_i38.GetAllBrandsUseCase>(
        () => _i38.GetAllBrandsUseCase(gh<_i35.MainRepo>()));
    gh.factory<_i39.GetAllCategoriesUseCase>(
        () => _i39.GetAllCategoriesUseCase(gh<_i35.MainRepo>()));
    gh.factory<_i40.GetAllProductsUseCase>(
        () => _i40.GetAllProductsUseCase(gh<_i35.MainRepo>()));
    gh.factory<_i41.GetProductsWithBrandIDUseCase>(
        () => _i41.GetProductsWithBrandIDUseCase(gh<_i35.MainRepo>()));
    gh.factory<_i42.GetProductsWithCategoryIDUseCase>(
        () => _i42.GetProductsWithCategoryIDUseCase(gh<_i35.MainRepo>()));
    gh.factory<_i43.GetWishListUseCase>(
        () => _i43.GetWishListUseCase(gh<_i35.MainRepo>()));
    gh.factory<_i44.RemoveFromWishListUseCase>(
        () => _i44.RemoveFromWishListUseCase(gh<_i35.MainRepo>()));
    gh.factory<_i45.GetAllProductsWithFiltrationUseCase>(
        () => _i45.GetAllProductsWithFiltrationUseCase(gh<_i35.MainRepo>()));
    gh.factory<_i46.GetUserAddressesUseCase>(
        () => _i46.GetUserAddressesUseCase(gh<_i27.UserAddressesRepo>()));
    gh.factory<_i47.DeleteUserAddressesUseCase>(
        () => _i47.DeleteUserAddressesUseCase(gh<_i27.UserAddressesRepo>()));
    gh.factory<_i48.AddUserAddressUseCase>(
        () => _i48.AddUserAddressUseCase(gh<_i27.UserAddressesRepo>()));
    gh.factory<_i49.SignInRepoDS>(
        () => _i50.SignInRepoDSImpl(gh<_i3.SharedPrefsUtils>()));
    gh.factory<_i51.SignUpRepo>(
        () => _i52.SignUpRepoImpl(gh<_i33.SignUpRepoDS>()));
    gh.factory<_i53.VerifyEmailRepo>(
        () => _i54.VerifyEmailRepoImpl(gh<_i9.VerifyEmailRepoDS>()));
    gh.factory<_i55.ResetPasswordRepo>(
        () => _i56.RestPasswordRepoImpl(gh<_i17.ResetPasswordRepoDS>()));
    gh.factory<_i57.GetSpecificProductUseCase>(() =>
        _i57.GetSpecificProductUseCase(gh<_i31.GetSpecificProductRepo>()));
    gh.factory<_i58.SignInRepo>(
        () => _i59.SignInRepoImpl(gh<_i49.SignInRepoDS>()));
    gh.factory<_i60.GetCartUseCase>(
        () => _i60.GetCartUseCase(gh<_i23.CartRepo>()));
    gh.factory<_i61.AddToCartUseCase>(
        () => _i61.AddToCartUseCase(gh<_i23.CartRepo>()));
    gh.factory<_i62.RemoveFromCartUseCase>(
        () => _i62.RemoveFromCartUseCase(gh<_i23.CartRepo>()));
    gh.factory<_i63.UpdateProductInCartUseCase>(
        () => _i63.UpdateProductInCartUseCase(gh<_i23.CartRepo>()));
    gh.factory<_i64.MainViewModel>(() => _i64.MainViewModel(
          gh<_i39.GetAllCategoriesUseCase>(),
          gh<_i40.GetAllProductsUseCase>(),
          gh<_i38.GetAllBrandsUseCase>(),
          gh<_i41.GetProductsWithBrandIDUseCase>(),
          gh<_i42.GetProductsWithCategoryIDUseCase>(),
          gh<_i43.GetWishListUseCase>(),
          gh<_i37.AddToWishListUseCase>(),
          gh<_i44.RemoveFromWishListUseCase>(),
          gh<_i45.GetAllProductsWithFiltrationUseCase>(),
          gh<_i60.GetCartUseCase>(),
          gh<_i61.AddToCartUseCase>(),
          gh<_i62.RemoveFromCartUseCase>(),
          gh<_i63.UpdateProductInCartUseCase>(),
        ));
    gh.factory<_i65.VerifySentCodeUseCase>(
        () => _i65.VerifySentCodeUseCase(gh<_i29.VerifySentCodeRepo>()));
    gh.factory<_i66.SignInUseCase>(
        () => _i66.SignInUseCase(gh<_i58.SignInRepo>()));
    gh.factory<_i67.EditProfileUseCase>(
        () => _i67.EditProfileUseCase(gh<_i25.EditProfileRepo>()));
    gh.factory<_i68.ResetPasswordUseCase>(
        () => _i68.ResetPasswordUseCase(gh<_i55.ResetPasswordRepo>()));
    gh.factory<_i69.CartViewModel>(
        () => _i69.CartViewModel(gh<_i63.UpdateProductInCartUseCase>()));
    gh.factory<_i70.VerifyEmailUseCase>(
        () => _i70.VerifyEmailUseCase(gh<_i53.VerifyEmailRepo>()));
    gh.factory<_i71.AddressesViewModel>(() => _i71.AddressesViewModel(
          gh<_i46.GetUserAddressesUseCase>(),
          gh<_i47.DeleteUserAddressesUseCase>(),
          gh<_i48.AddUserAddressUseCase>(),
        ));
    gh.factory<_i72.ProductDetailsViewModel>(() =>
        _i72.ProductDetailsViewModel(gh<_i57.GetSpecificProductUseCase>()));
    gh.factory<_i73.EditProfileTabViewModel>(
        () => _i73.EditProfileTabViewModel(gh<_i67.EditProfileUseCase>()));
    gh.factory<_i74.SignUpUseCase>(
        () => _i74.SignUpUseCase(gh<_i51.SignUpRepo>()));
    gh.factory<_i75.SignInViewModel>(
        () => _i75.SignInViewModel(gh<_i66.SignInUseCase>()));
    gh.factory<_i76.ResetPasswordViewModel>(
        () => _i76.ResetPasswordViewModel(gh<_i68.ResetPasswordUseCase>()));
    gh.factory<_i77.VerifySentCodeViewModel>(() => _i77.VerifySentCodeViewModel(
          gh<_i70.VerifyEmailUseCase>(),
          gh<_i65.VerifySentCodeUseCase>(),
        ));
    gh.factory<_i78.SignUpViewModel>(
        () => _i78.SignUpViewModel(gh<_i74.SignUpUseCase>()));
    gh.factory<_i79.VerifyEmailViewModel>(
        () => _i79.VerifyEmailViewModel(gh<_i70.VerifyEmailUseCase>()));
    return this;
  }
}
