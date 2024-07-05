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
    as _i15;
import '../../data/repos/authentication_repos/ediit_profile_repo/edit_profile_repo_impl.dart'
    as _i27;
import '../../data/repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo_ds_impl.dart'
    as _i21;
import '../../data/repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo_impl.dart'
    as _i61;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo_ds_impl.dart'
    as _i13;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo_impl.dart'
    as _i59;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_sent_code_reo/verify_sent_code_repo_ds_impl.dart'
    as _i17;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_sent_code_reo/verify_sent_code_repo_impl.dart'
    as _i31;
import '../../data/repos/authentication_repos/sign_in_repo/sign_in_repo_ds_impl.dart'
    as _i53;
import '../../data/repos/authentication_repos/sign_in_repo/sign_in_repo_impl.dart'
    as _i64;
import '../../data/repos/authentication_repos/sign_up_repo/sign_up_repo_ds_impl.dart'
    as _i35;
import '../../data/repos/authentication_repos/sign_up_repo/sign_up_repo_impl.dart'
    as _i57;
import '../../data/repos/cart_repos/cart_repo_ds_impl.dart' as _i55;
import '../../data/repos/cart_repos/cart_repo_impl.dart' as _i71;
import '../../data/repos/checkout_repos/checkout_repo_ds_impl.dart' as _i19;
import '../../data/repos/checkout_repos/checkout_repo_impl.dart' as _i39;
import '../../data/repos/get_specific_product_repos/get_specific_product_repo_ds_impl.dart'
    as _i23;
import '../../data/repos/get_specific_product_repos/get_specific_product_repo_impl.dart'
    as _i33;
import '../../data/repos/main_repos/main_repo_ds_impl.dart' as _i11;
import '../../data/repos/main_repos/main_repo_impl.dart' as _i37;
import '../../data/repos/user_addresses_repos/user_addresses_repo_ds_impl.dart'
    as _i25;
import '../../data/repos/user_addresses_repos/user_addresses_repo_impl.dart'
    as _i29;
import '../../data/utils/shared_prefs_utils.dart' as _i3;
import '../../ui/screens/all_products/all_products_view_model.dart' as _i4;
import '../../ui/screens/authentication/forgot_password/reset_password/reset_password_view_model.dart'
    as _i86;
import '../../ui/screens/authentication/forgot_password/verify_email/verify_email_view_model.dart'
    as _i90;
import '../../ui/screens/authentication/forgot_password/verify_sent_code/verify_sent_code_view_model.dart'
    as _i88;
import '../../ui/screens/authentication/sign_in/sign_in_view_model.dart'
    as _i80;
import '../../ui/screens/authentication/sign_up/sign_up_view_model.dart'
    as _i89;
import '../../ui/screens/cart/cart_view_model.dart' as _i91;
import '../../ui/screens/checkout/checkout_view_model.dart' as _i5;
import '../../ui/screens/checkout/tabs/confirmation/confirmation_view_model.dart'
    as _i76;
import '../../ui/screens/checkout/tabs/payment/payment_view_model.dart' as _i85;
import '../../ui/screens/checkout/tabs/payment_methods/payment_methods_view_model.dart'
    as _i6;
import '../../ui/screens/checkout/tabs/shipping/shipping_view_model.dart'
    as _i7;
import '../../ui/screens/main/main_view_model.dart' as _i87;
import '../../ui/screens/main/tabs/profile/profile_tab_view_model.dart' as _i8;
import '../../ui/screens/main/tabs/profile/tabs/addresses/addresses_view_model.dart'
    as _i75;
import '../../ui/screens/main/tabs/profile/tabs/edit_profile/edit_profile_tab_view_model.dart'
    as _i78;
import '../../ui/screens/product_details/product_details_view_model.dart'
    as _i77;
import '../../ui/screens/products_of_category/products_of_category_view_model.dart'
    as _i9;
import '../repos/authentication_repos/edit_profile_repo/edit_profile_repo.dart'
    as _i26;
import '../repos/authentication_repos/edit_profile_repo/edit_profile_repo_ds.dart'
    as _i14;
import '../repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo.dart'
    as _i60;
import '../repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo_ds.dart'
    as _i20;
import '../repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo.dart'
    as _i58;
import '../repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo_ds.dart'
    as _i12;
import '../repos/authentication_repos/forgot_password_repos/verify_sent_code_repo/verify_sent_code_repo.dart'
    as _i30;
import '../repos/authentication_repos/forgot_password_repos/verify_sent_code_repo/verify_sent_code_repo_ds.dart'
    as _i16;
import '../repos/authentication_repos/sign_in_repo/sign_in_repo.dart' as _i63;
import '../repos/authentication_repos/sign_in_repo/sign_in_repo_ds.dart'
    as _i52;
import '../repos/authentication_repos/sign_up_repo/sign_up_repo.dart' as _i56;
import '../repos/authentication_repos/sign_up_repo/sign_up_repo_ds.dart'
    as _i34;
import '../repos/cart_repos/cart_repo.dart' as _i70;
import '../repos/cart_repos/cart_repo_ds.dart' as _i54;
import '../repos/checkout_repos/checkout_repo.dart' as _i38;
import '../repos/checkout_repos/checkout_repo_ds.dart' as _i18;
import '../repos/get_specific_product_repos/get_specific_product_repo.dart'
    as _i32;
import '../repos/get_specific_product_repos/get_specific_product_repo_ds.dart'
    as _i22;
import '../repos/main_repos/main_repo.dart' as _i36;
import '../repos/main_repos/main_repo_ds.dart' as _i10;
import '../repos/user_addresses_repos/user_addresses_repo.dart' as _i28;
import '../repos/user_addresses_repos/user_addresses_repo_ds.dart' as _i24;
import '../use_cases/addresses_use_cases/add_new_address_use_case.dart' as _i49;
import '../use_cases/addresses_use_cases/delete_user_address_use_case.dart'
    as _i50;
import '../use_cases/addresses_use_cases/get_user_addresses_use_case.dart'
    as _i51;
import '../use_cases/authentication_use_cases/edit_profile_use_case.dart'
    as _i72;
import '../use_cases/authentication_use_cases/forgot_password_use_cases/reset_password_use_case.dart'
    as _i73;
import '../use_cases/authentication_use_cases/forgot_password_use_cases/verify_email_use_case.dart'
    as _i74;
import '../use_cases/authentication_use_cases/forgot_password_use_cases/verify_sent_code_use_case.dart'
    as _i68;
import '../use_cases/authentication_use_cases/sign_in_use_case.dart' as _i69;
import '../use_cases/authentication_use_cases/sign_up_use_case.dart' as _i79;
import '../use_cases/cart_use_cases/add_to_cart_use_case.dart' as _i81;
import '../use_cases/cart_use_cases/get_cart_use_case.dart' as _i82;
import '../use_cases/cart_use_cases/remove_from_cart_use_case.dart' as _i83;
import '../use_cases/cart_use_cases/update_product_in_cart_use_case.dart'
    as _i84;
import '../use_cases/checkout_use_cases/checkout_use_case.dart' as _i65;
import '../use_cases/checkout_use_cases/get_kiosk_bill_reference_use_case.dart'
    as _i67;
import '../use_cases/checkout_use_cases/pay_use_case.dart' as _i66;
import '../use_cases/get_specific_product_use_case/get_specific_product_use_case.dart'
    as _i62;
import '../use_cases/main_use_cases/add_to_wish_list_use_case.dart' as _i40;
import '../use_cases/main_use_cases/get_all_brands_use_case.dart' as _i41;
import '../use_cases/main_use_cases/get_all_categories_use_case.dart' as _i42;
import '../use_cases/main_use_cases/get_all_products_use_case.dart' as _i43;
import '../use_cases/main_use_cases/get_all_products_with_filtration_use_case.dart'
    as _i44;
import '../use_cases/main_use_cases/get_products_with_brand_id_use_case.dart'
    as _i45;
import '../use_cases/main_use_cases/get_products_with_category_id_use_case.dart'
    as _i46;
import '../use_cases/main_use_cases/get_wish_list_use_case.dart' as _i47;
import '../use_cases/main_use_cases/remove_from_wish_list_use_case.dart'
    as _i48;

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
    gh.factory<_i5.CheckoutViewModel>(() => _i5.CheckoutViewModel());
    gh.factory<_i6.PaymentMethodsViewModel>(
        () => _i6.PaymentMethodsViewModel());
    gh.factory<_i7.ShippingViewModel>(() => _i7.ShippingViewModel());
    gh.factory<_i8.ProfileTabViewModel>(() => _i8.ProfileTabViewModel());
    gh.factory<_i9.ProductsOfCategoryViewModel>(
        () => _i9.ProductsOfCategoryViewModel());
    gh.factory<_i10.MainRepoDS>(() => _i11.MainRepoDSImpl());
    gh.factory<_i12.VerifyEmailRepoDS>(() => _i13.VerifyEmailRepoDSImpl());
    gh.factory<_i14.EditProfileRepoDS>(() => _i15.EditProfileRpoDSImpl());
    gh.factory<_i16.VerifySentCodeRepoDS>(
        () => _i17.VerifySentCodeRepoDSImpl());
    gh.factory<_i18.CheckoutRepoDS>(() => _i19.CheckoutRepoDSImpl());
    gh.factory<_i20.ResetPasswordRepoDS>(() => _i21.ResetPasswordRepoDSImpl());
    gh.factory<_i22.GetSpecificProductRepoDS>(
        () => _i23.GetSpecificProductRepoDSImpl());
    gh.factory<_i24.UserAddressesRepoDS>(() => _i25.UserAddressesRepoDSImpl());
    gh.factory<_i26.EditProfileRepo>(
        () => _i27.EditProfileRepoImpl(gh<_i14.EditProfileRepoDS>()));
    gh.factory<_i28.UserAddressesRepo>(
        () => _i29.UserAddressesRepoImpl(gh<_i24.UserAddressesRepoDS>()));
    gh.factory<_i30.VerifySentCodeRepo>(
        () => _i31.VerifySentCodeRepoImpl(gh<_i16.VerifySentCodeRepoDS>()));
    gh.factory<_i32.GetSpecificProductRepo>(() =>
        _i33.GetSpecificProductRepoImpl(gh<_i22.GetSpecificProductRepoDS>()));
    gh.factory<_i34.SignUpRepoDS>(
        () => _i35.SignUpRepoDSImpl(gh<_i3.SharedPrefsUtils>()));
    gh.factory<_i36.MainRepo>(() => _i37.MainRepoImpl(gh<_i10.MainRepoDS>()));
    gh.factory<_i38.CheckoutRepo>(
        () => _i39.CheckoutRepoImpl(gh<_i18.CheckoutRepoDS>()));
    gh.factory<_i40.AddToWishListUseCase>(
        () => _i40.AddToWishListUseCase(gh<_i36.MainRepo>()));
    gh.factory<_i41.GetAllBrandsUseCase>(
        () => _i41.GetAllBrandsUseCase(gh<_i36.MainRepo>()));
    gh.factory<_i42.GetAllCategoriesUseCase>(
        () => _i42.GetAllCategoriesUseCase(gh<_i36.MainRepo>()));
    gh.factory<_i43.GetAllProductsUseCase>(
        () => _i43.GetAllProductsUseCase(gh<_i36.MainRepo>()));
    gh.factory<_i44.GetAllProductsWithFiltrationUseCase>(
        () => _i44.GetAllProductsWithFiltrationUseCase(gh<_i36.MainRepo>()));
    gh.factory<_i45.GetProductsWithBrandIDUseCase>(
        () => _i45.GetProductsWithBrandIDUseCase(gh<_i36.MainRepo>()));
    gh.factory<_i46.GetProductsWithCategoryIDUseCase>(
        () => _i46.GetProductsWithCategoryIDUseCase(gh<_i36.MainRepo>()));
    gh.factory<_i47.GetWishListUseCase>(
        () => _i47.GetWishListUseCase(gh<_i36.MainRepo>()));
    gh.factory<_i48.RemoveFromWishListUseCase>(
        () => _i48.RemoveFromWishListUseCase(gh<_i36.MainRepo>()));
    gh.factory<_i49.AddUserAddressUseCase>(
        () => _i49.AddUserAddressUseCase(gh<_i28.UserAddressesRepo>()));
    gh.factory<_i50.DeleteUserAddressesUseCase>(
        () => _i50.DeleteUserAddressesUseCase(gh<_i28.UserAddressesRepo>()));
    gh.factory<_i51.GetUserAddressesUseCase>(
        () => _i51.GetUserAddressesUseCase(gh<_i28.UserAddressesRepo>()));
    gh.factory<_i52.SignInRepoDS>(
        () => _i53.SignInRepoDSImpl(gh<_i3.SharedPrefsUtils>()));
    gh.factory<_i54.CartRepoDS>(
        () => _i55.CartRepoDSImpl(gh<_i3.SharedPrefsUtils>()));
    gh.factory<_i56.SignUpRepo>(
        () => _i57.SignUpRepoImpl(gh<_i34.SignUpRepoDS>()));
    gh.factory<_i58.VerifyEmailRepo>(
        () => _i59.VerifyEmailRepoImpl(gh<_i12.VerifyEmailRepoDS>()));
    gh.factory<_i60.ResetPasswordRepo>(
        () => _i61.RestPasswordRepoImpl(gh<_i20.ResetPasswordRepoDS>()));
    gh.factory<_i62.GetSpecificProductUseCase>(() =>
        _i62.GetSpecificProductUseCase(gh<_i32.GetSpecificProductRepo>()));
    gh.factory<_i63.SignInRepo>(
        () => _i64.SignInRepoImpl(gh<_i52.SignInRepoDS>()));
    gh.factory<_i65.CheckoutUseCase>(
        () => _i65.CheckoutUseCase(gh<_i38.CheckoutRepo>()));
    gh.factory<_i66.PayUseCase>(() => _i66.PayUseCase(gh<_i38.CheckoutRepo>()));
    gh.factory<_i67.GetKioskBillReferenceUseCase>(
        () => _i67.GetKioskBillReferenceUseCase(gh<_i38.CheckoutRepo>()));
    gh.factory<_i68.VerifySentCodeUseCase>(
        () => _i68.VerifySentCodeUseCase(gh<_i30.VerifySentCodeRepo>()));
    gh.factory<_i69.SignInUseCase>(
        () => _i69.SignInUseCase(gh<_i63.SignInRepo>()));
    gh.factory<_i70.CartRepo>(() => _i71.CartRepoImpl(gh<_i54.CartRepoDS>()));
    gh.factory<_i72.EditProfileUseCase>(
        () => _i72.EditProfileUseCase(gh<_i26.EditProfileRepo>()));
    gh.factory<_i73.ResetPasswordUseCase>(
        () => _i73.ResetPasswordUseCase(gh<_i60.ResetPasswordRepo>()));
    gh.factory<_i74.VerifyEmailUseCase>(
        () => _i74.VerifyEmailUseCase(gh<_i58.VerifyEmailRepo>()));
    gh.factory<_i75.AddressesViewModel>(() => _i75.AddressesViewModel(
          gh<_i51.GetUserAddressesUseCase>(),
          gh<_i50.DeleteUserAddressesUseCase>(),
          gh<_i49.AddUserAddressUseCase>(),
        ));
    gh.factory<_i76.ConfirmationViewModel>(
        () => _i76.ConfirmationViewModel(gh<_i65.CheckoutUseCase>()));
    gh.factory<_i77.ProductDetailsViewModel>(() =>
        _i77.ProductDetailsViewModel(gh<_i62.GetSpecificProductUseCase>()));
    gh.factory<_i78.EditProfileTabViewModel>(
        () => _i78.EditProfileTabViewModel(gh<_i72.EditProfileUseCase>()));
    gh.factory<_i79.SignUpUseCase>(
        () => _i79.SignUpUseCase(gh<_i56.SignUpRepo>()));
    gh.factory<_i80.SignInViewModel>(
        () => _i80.SignInViewModel(gh<_i69.SignInUseCase>()));
    gh.factory<_i81.AddToCartUseCase>(
        () => _i81.AddToCartUseCase(gh<_i70.CartRepo>()));
    gh.factory<_i82.GetCartUseCase>(
        () => _i82.GetCartUseCase(gh<_i70.CartRepo>()));
    gh.factory<_i83.RemoveFromCartUseCase>(
        () => _i83.RemoveFromCartUseCase(gh<_i70.CartRepo>()));
    gh.factory<_i84.UpdateProductInCartUseCase>(
        () => _i84.UpdateProductInCartUseCase(gh<_i70.CartRepo>()));
    gh.factory<_i85.PaymentViewModel>(() => _i85.PaymentViewModel(
          gh<_i66.PayUseCase>(),
          gh<_i67.GetKioskBillReferenceUseCase>(),
        ));
    gh.factory<_i86.ResetPasswordViewModel>(
        () => _i86.ResetPasswordViewModel(gh<_i73.ResetPasswordUseCase>()));
    gh.factory<_i87.MainViewModel>(() => _i87.MainViewModel(
          gh<_i42.GetAllCategoriesUseCase>(),
          gh<_i43.GetAllProductsUseCase>(),
          gh<_i41.GetAllBrandsUseCase>(),
          gh<_i45.GetProductsWithBrandIDUseCase>(),
          gh<_i46.GetProductsWithCategoryIDUseCase>(),
          gh<_i47.GetWishListUseCase>(),
          gh<_i40.AddToWishListUseCase>(),
          gh<_i48.RemoveFromWishListUseCase>(),
          gh<_i44.GetAllProductsWithFiltrationUseCase>(),
          gh<_i82.GetCartUseCase>(),
          gh<_i81.AddToCartUseCase>(),
          gh<_i83.RemoveFromCartUseCase>(),
          gh<_i84.UpdateProductInCartUseCase>(),
        ));
    gh.factory<_i88.VerifySentCodeViewModel>(() => _i88.VerifySentCodeViewModel(
          gh<_i74.VerifyEmailUseCase>(),
          gh<_i68.VerifySentCodeUseCase>(),
        ));
    gh.factory<_i89.SignUpViewModel>(
        () => _i89.SignUpViewModel(gh<_i79.SignUpUseCase>()));
    gh.factory<_i90.VerifyEmailViewModel>(
        () => _i90.VerifyEmailViewModel(gh<_i74.VerifyEmailUseCase>()));
    gh.factory<_i91.CartViewModel>(() => _i91.CartViewModel(
          gh<_i84.UpdateProductInCartUseCase>(),
          gh<_i65.CheckoutUseCase>(),
        ));
    return this;
  }
}
