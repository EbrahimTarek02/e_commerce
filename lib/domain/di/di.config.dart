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
    as _i16;
import '../../data/repos/authentication_repos/ediit_profile_repo/edit_profile_repo_impl.dart'
    as _i30;
import '../../data/repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo_ds_impl.dart'
    as _i22;
import '../../data/repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo_impl.dart'
    as _i66;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo_ds_impl.dart'
    as _i14;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo_impl.dart'
    as _i64;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_sent_code_reo/verify_sent_code_repo_ds_impl.dart'
    as _i18;
import '../../data/repos/authentication_repos/forgot_password_repos/verify_sent_code_reo/verify_sent_code_repo_impl.dart'
    as _i34;
import '../../data/repos/authentication_repos/sign_in_repo/sign_in_repo_ds_impl.dart'
    as _i58;
import '../../data/repos/authentication_repos/sign_in_repo/sign_in_repo_impl.dart'
    as _i69;
import '../../data/repos/authentication_repos/sign_up_repo/sign_up_repo_ds_impl.dart'
    as _i40;
import '../../data/repos/authentication_repos/sign_up_repo/sign_up_repo_impl.dart'
    as _i62;
import '../../data/repos/cart_repos/cart_repo_ds_impl.dart' as _i60;
import '../../data/repos/cart_repos/cart_repo_impl.dart' as _i76;
import '../../data/repos/checkout_repos/checkout_repo_ds_impl.dart' as _i20;
import '../../data/repos/checkout_repos/checkout_repo_impl.dart' as _i44;
import '../../data/repos/get_specific_product_repos/get_specific_product_repo_ds_impl.dart'
    as _i24;
import '../../data/repos/get_specific_product_repos/get_specific_product_repo_impl.dart'
    as _i36;
import '../../data/repos/main_repos/main_repo_ds_impl.dart' as _i12;
import '../../data/repos/main_repos/main_repo_impl.dart' as _i42;
import '../../data/repos/orders_repos/orders_repo_ds_impl.dart' as _i26;
import '../../data/repos/orders_repos/orders_repo_impl.dart' as _i38;
import '../../data/repos/user_addresses_repos/user_addresses_repo_ds_impl.dart'
    as _i28;
import '../../data/repos/user_addresses_repos/user_addresses_repo_impl.dart'
    as _i32;
import '../../data/utils/shared_prefs_utils.dart' as _i3;
import '../../ui/screens/all_products/all_products_view_model.dart' as _i4;
import '../../ui/screens/authentication/forgot_password/reset_password/reset_password_view_model.dart'
    as _i93;
import '../../ui/screens/authentication/forgot_password/verify_email/verify_email_view_model.dart'
    as _i96;
import '../../ui/screens/authentication/forgot_password/verify_sent_code/verify_sent_code_view_model.dart'
    as _i94;
import '../../ui/screens/authentication/sign_in/sign_in_view_model.dart'
    as _i87;
import '../../ui/screens/authentication/sign_up/sign_up_view_model.dart'
    as _i95;
import '../../ui/screens/cart/cart_view_model.dart' as _i97;
import '../../ui/screens/checkout/checkout_view_model.dart' as _i5;
import '../../ui/screens/checkout/tabs/confirmation/confirmation_view_model.dart'
    as _i82;
import '../../ui/screens/checkout/tabs/payment/payment_view_model.dart' as _i92;
import '../../ui/screens/checkout/tabs/payment_methods/payment_methods_view_model.dart'
    as _i6;
import '../../ui/screens/checkout/tabs/shipping/shipping_view_model.dart'
    as _i7;
import '../../ui/screens/main/main_view_model.dart' as _i98;
import '../../ui/screens/main/tabs/profile/profile_tab_view_model.dart' as _i8;
import '../../ui/screens/main/tabs/profile/tabs/addresses/addresses_view_model.dart'
    as _i80;
import '../../ui/screens/main/tabs/profile/tabs/edit_profile/edit_profile_tab_view_model.dart'
    as _i85;
import '../../ui/screens/main/tabs/profile/tabs/orders/orders_view_model.dart'
    as _i83;
import '../../ui/screens/order_details/order_details_view_model.dart' as _i10;
import '../../ui/screens/product_details/product_details_view_model.dart'
    as _i84;
import '../../ui/screens/products_of_category/products_of_category_view_model.dart'
    as _i9;
import '../repos/authentication_repos/edit_profile_repo/edit_profile_repo.dart'
    as _i29;
import '../repos/authentication_repos/edit_profile_repo/edit_profile_repo_ds.dart'
    as _i15;
import '../repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo.dart'
    as _i65;
import '../repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo_ds.dart'
    as _i21;
import '../repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo.dart'
    as _i63;
import '../repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo_ds.dart'
    as _i13;
import '../repos/authentication_repos/forgot_password_repos/verify_sent_code_repo/verify_sent_code_repo.dart'
    as _i33;
import '../repos/authentication_repos/forgot_password_repos/verify_sent_code_repo/verify_sent_code_repo_ds.dart'
    as _i17;
import '../repos/authentication_repos/sign_in_repo/sign_in_repo.dart' as _i68;
import '../repos/authentication_repos/sign_in_repo/sign_in_repo_ds.dart'
    as _i57;
import '../repos/authentication_repos/sign_up_repo/sign_up_repo.dart' as _i61;
import '../repos/authentication_repos/sign_up_repo/sign_up_repo_ds.dart'
    as _i39;
import '../repos/cart_repos/cart_repo.dart' as _i75;
import '../repos/cart_repos/cart_repo_ds.dart' as _i59;
import '../repos/checkout_repos/checkout_repo.dart' as _i43;
import '../repos/checkout_repos/checkout_repo_ds.dart' as _i19;
import '../repos/get_specific_product_repos/get_specific_product_repo.dart'
    as _i35;
import '../repos/get_specific_product_repos/get_specific_product_repo_ds.dart'
    as _i23;
import '../repos/main_repos/main_repo.dart' as _i41;
import '../repos/main_repos/main_repo_ds.dart' as _i11;
import '../repos/orders_repo/orders_repo.dart' as _i37;
import '../repos/orders_repo/orders_repo_ds.dart' as _i25;
import '../repos/user_addresses_repos/user_addresses_repo.dart' as _i31;
import '../repos/user_addresses_repos/user_addresses_repo_ds.dart' as _i27;
import '../use_cases/addresses_use_cases/add_new_address_use_case.dart' as _i54;
import '../use_cases/addresses_use_cases/delete_user_address_use_case.dart'
    as _i55;
import '../use_cases/addresses_use_cases/get_user_addresses_use_case.dart'
    as _i56;
import '../use_cases/authentication_use_cases/edit_profile_use_case.dart'
    as _i77;
import '../use_cases/authentication_use_cases/forgot_password_use_cases/reset_password_use_case.dart'
    as _i78;
import '../use_cases/authentication_use_cases/forgot_password_use_cases/verify_email_use_case.dart'
    as _i79;
import '../use_cases/authentication_use_cases/forgot_password_use_cases/verify_sent_code_use_case.dart'
    as _i73;
import '../use_cases/authentication_use_cases/sign_in_use_case.dart' as _i74;
import '../use_cases/authentication_use_cases/sign_up_use_case.dart' as _i86;
import '../use_cases/cart_use_cases/add_to_cart_use_case.dart' as _i88;
import '../use_cases/cart_use_cases/get_cart_use_case.dart' as _i89;
import '../use_cases/cart_use_cases/remove_from_cart_use_case.dart' as _i90;
import '../use_cases/cart_use_cases/update_product_in_cart_use_case.dart'
    as _i91;
import '../use_cases/checkout_use_cases/checkout_use_case.dart' as _i70;
import '../use_cases/checkout_use_cases/get_kiosk_bill_reference_use_case.dart'
    as _i72;
import '../use_cases/checkout_use_cases/pay_use_case.dart' as _i71;
import '../use_cases/get_specific_product_use_case/get_specific_product_use_case.dart'
    as _i67;
import '../use_cases/main_use_cases/add_to_wish_list_use_case.dart' as _i45;
import '../use_cases/main_use_cases/get_all_brands_use_case.dart' as _i46;
import '../use_cases/main_use_cases/get_all_categories_use_case.dart' as _i47;
import '../use_cases/main_use_cases/get_all_products_use_case.dart' as _i48;
import '../use_cases/main_use_cases/get_all_products_with_filtration_use_case.dart'
    as _i49;
import '../use_cases/main_use_cases/get_products_with_brand_id_use_case.dart'
    as _i50;
import '../use_cases/main_use_cases/get_products_with_category_id_use_case.dart'
    as _i51;
import '../use_cases/main_use_cases/get_wish_list_use_case.dart' as _i52;
import '../use_cases/main_use_cases/remove_from_wish_list_use_case.dart'
    as _i53;
import '../use_cases/orders_use_case/orders_use_case.dart' as _i81;

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
    gh.factory<_i10.OrderDetailsViewModel>(() => _i10.OrderDetailsViewModel());
    gh.factory<_i11.MainRepoDS>(() => _i12.MainRepoDSImpl());
    gh.factory<_i13.VerifyEmailRepoDS>(() => _i14.VerifyEmailRepoDSImpl());
    gh.factory<_i15.EditProfileRepoDS>(() => _i16.EditProfileRpoDSImpl());
    gh.factory<_i17.VerifySentCodeRepoDS>(
        () => _i18.VerifySentCodeRepoDSImpl());
    gh.factory<_i19.CheckoutRepoDS>(() => _i20.CheckoutRepoDSImpl());
    gh.factory<_i21.ResetPasswordRepoDS>(() => _i22.ResetPasswordRepoDSImpl());
    gh.factory<_i23.GetSpecificProductRepoDS>(
        () => _i24.GetSpecificProductRepoDSImpl());
    gh.factory<_i25.OrdersRepoDs>(() => _i26.OrdersRepoDsImpl());
    gh.factory<_i27.UserAddressesRepoDS>(() => _i28.UserAddressesRepoDSImpl());
    gh.factory<_i29.EditProfileRepo>(
        () => _i30.EditProfileRepoImpl(gh<_i15.EditProfileRepoDS>()));
    gh.factory<_i31.UserAddressesRepo>(
        () => _i32.UserAddressesRepoImpl(gh<_i27.UserAddressesRepoDS>()));
    gh.factory<_i33.VerifySentCodeRepo>(
        () => _i34.VerifySentCodeRepoImpl(gh<_i17.VerifySentCodeRepoDS>()));
    gh.factory<_i35.GetSpecificProductRepo>(() =>
        _i36.GetSpecificProductRepoImpl(gh<_i23.GetSpecificProductRepoDS>()));
    gh.factory<_i37.OrdersRepo>(
        () => _i38.OrdersRepoImpl(gh<_i25.OrdersRepoDs>()));
    gh.factory<_i39.SignUpRepoDS>(
        () => _i40.SignUpRepoDSImpl(gh<_i3.SharedPrefsUtils>()));
    gh.factory<_i41.MainRepo>(() => _i42.MainRepoImpl(gh<_i11.MainRepoDS>()));
    gh.factory<_i43.CheckoutRepo>(
        () => _i44.CheckoutRepoImpl(gh<_i19.CheckoutRepoDS>()));
    gh.factory<_i45.AddToWishListUseCase>(
        () => _i45.AddToWishListUseCase(gh<_i41.MainRepo>()));
    gh.factory<_i46.GetAllBrandsUseCase>(
        () => _i46.GetAllBrandsUseCase(gh<_i41.MainRepo>()));
    gh.factory<_i47.GetAllCategoriesUseCase>(
        () => _i47.GetAllCategoriesUseCase(gh<_i41.MainRepo>()));
    gh.factory<_i48.GetAllProductsUseCase>(
        () => _i48.GetAllProductsUseCase(gh<_i41.MainRepo>()));
    gh.factory<_i49.GetAllProductsWithFiltrationUseCase>(
        () => _i49.GetAllProductsWithFiltrationUseCase(gh<_i41.MainRepo>()));
    gh.factory<_i50.GetProductsWithBrandIDUseCase>(
        () => _i50.GetProductsWithBrandIDUseCase(gh<_i41.MainRepo>()));
    gh.factory<_i51.GetProductsWithCategoryIDUseCase>(
        () => _i51.GetProductsWithCategoryIDUseCase(gh<_i41.MainRepo>()));
    gh.factory<_i52.GetWishListUseCase>(
        () => _i52.GetWishListUseCase(gh<_i41.MainRepo>()));
    gh.factory<_i53.RemoveFromWishListUseCase>(
        () => _i53.RemoveFromWishListUseCase(gh<_i41.MainRepo>()));
    gh.factory<_i54.AddUserAddressUseCase>(
        () => _i54.AddUserAddressUseCase(gh<_i31.UserAddressesRepo>()));
    gh.factory<_i55.DeleteUserAddressesUseCase>(
        () => _i55.DeleteUserAddressesUseCase(gh<_i31.UserAddressesRepo>()));
    gh.factory<_i56.GetUserAddressesUseCase>(
        () => _i56.GetUserAddressesUseCase(gh<_i31.UserAddressesRepo>()));
    gh.factory<_i57.SignInRepoDS>(
        () => _i58.SignInRepoDSImpl(gh<_i3.SharedPrefsUtils>()));
    gh.factory<_i59.CartRepoDS>(
        () => _i60.CartRepoDSImpl(gh<_i3.SharedPrefsUtils>()));
    gh.factory<_i61.SignUpRepo>(
        () => _i62.SignUpRepoImpl(gh<_i39.SignUpRepoDS>()));
    gh.factory<_i63.VerifyEmailRepo>(
        () => _i64.VerifyEmailRepoImpl(gh<_i13.VerifyEmailRepoDS>()));
    gh.factory<_i65.ResetPasswordRepo>(
        () => _i66.RestPasswordRepoImpl(gh<_i21.ResetPasswordRepoDS>()));
    gh.factory<_i67.GetSpecificProductUseCase>(() =>
        _i67.GetSpecificProductUseCase(gh<_i35.GetSpecificProductRepo>()));
    gh.factory<_i68.SignInRepo>(
        () => _i69.SignInRepoImpl(gh<_i57.SignInRepoDS>()));
    gh.factory<_i70.CheckoutUseCase>(
        () => _i70.CheckoutUseCase(gh<_i43.CheckoutRepo>()));
    gh.factory<_i71.PayUseCase>(() => _i71.PayUseCase(gh<_i43.CheckoutRepo>()));
    gh.factory<_i72.GetKioskBillReferenceUseCase>(
        () => _i72.GetKioskBillReferenceUseCase(gh<_i43.CheckoutRepo>()));
    gh.factory<_i73.VerifySentCodeUseCase>(
        () => _i73.VerifySentCodeUseCase(gh<_i33.VerifySentCodeRepo>()));
    gh.factory<_i74.SignInUseCase>(
        () => _i74.SignInUseCase(gh<_i68.SignInRepo>()));
    gh.factory<_i75.CartRepo>(() => _i76.CartRepoImpl(gh<_i59.CartRepoDS>()));
    gh.factory<_i77.EditProfileUseCase>(
        () => _i77.EditProfileUseCase(gh<_i29.EditProfileRepo>()));
    gh.factory<_i78.ResetPasswordUseCase>(
        () => _i78.ResetPasswordUseCase(gh<_i65.ResetPasswordRepo>()));
    gh.factory<_i79.VerifyEmailUseCase>(
        () => _i79.VerifyEmailUseCase(gh<_i63.VerifyEmailRepo>()));
    gh.factory<_i80.AddressesViewModel>(() => _i80.AddressesViewModel(
          gh<_i56.GetUserAddressesUseCase>(),
          gh<_i55.DeleteUserAddressesUseCase>(),
          gh<_i54.AddUserAddressUseCase>(),
        ));
    gh.factory<_i81.OrdersUseCase>(
        () => _i81.OrdersUseCase(gh<_i37.OrdersRepo>()));
    gh.factory<_i82.ConfirmationViewModel>(
        () => _i82.ConfirmationViewModel(gh<_i70.CheckoutUseCase>()));
    gh.factory<_i83.OrdersViewModel>(
        () => _i83.OrdersViewModel(gh<_i81.OrdersUseCase>()));
    gh.factory<_i84.ProductDetailsViewModel>(() =>
        _i84.ProductDetailsViewModel(gh<_i67.GetSpecificProductUseCase>()));
    gh.factory<_i85.EditProfileTabViewModel>(
        () => _i85.EditProfileTabViewModel(gh<_i77.EditProfileUseCase>()));
    gh.factory<_i86.SignUpUseCase>(
        () => _i86.SignUpUseCase(gh<_i61.SignUpRepo>()));
    gh.factory<_i87.SignInViewModel>(
        () => _i87.SignInViewModel(gh<_i74.SignInUseCase>()));
    gh.factory<_i88.AddToCartUseCase>(
        () => _i88.AddToCartUseCase(gh<_i75.CartRepo>()));
    gh.factory<_i89.GetCartUseCase>(
        () => _i89.GetCartUseCase(gh<_i75.CartRepo>()));
    gh.factory<_i90.RemoveFromCartUseCase>(
        () => _i90.RemoveFromCartUseCase(gh<_i75.CartRepo>()));
    gh.factory<_i91.UpdateProductInCartUseCase>(
        () => _i91.UpdateProductInCartUseCase(gh<_i75.CartRepo>()));
    gh.factory<_i92.PaymentViewModel>(() => _i92.PaymentViewModel(
          gh<_i71.PayUseCase>(),
          gh<_i72.GetKioskBillReferenceUseCase>(),
        ));
    gh.factory<_i93.ResetPasswordViewModel>(
        () => _i93.ResetPasswordViewModel(gh<_i78.ResetPasswordUseCase>()));
    gh.factory<_i94.VerifySentCodeViewModel>(() => _i94.VerifySentCodeViewModel(
          gh<_i79.VerifyEmailUseCase>(),
          gh<_i73.VerifySentCodeUseCase>(),
        ));
    gh.factory<_i95.SignUpViewModel>(
        () => _i95.SignUpViewModel(gh<_i86.SignUpUseCase>()));
    gh.factory<_i96.VerifyEmailViewModel>(
        () => _i96.VerifyEmailViewModel(gh<_i79.VerifyEmailUseCase>()));
    gh.factory<_i97.CartViewModel>(() => _i97.CartViewModel(
          gh<_i91.UpdateProductInCartUseCase>(),
          gh<_i70.CheckoutUseCase>(),
        ));
    gh.factory<_i98.MainViewModel>(() => _i98.MainViewModel(
          gh<_i47.GetAllCategoriesUseCase>(),
          gh<_i48.GetAllProductsUseCase>(),
          gh<_i46.GetAllBrandsUseCase>(),
          gh<_i50.GetProductsWithBrandIDUseCase>(),
          gh<_i51.GetProductsWithCategoryIDUseCase>(),
          gh<_i52.GetWishListUseCase>(),
          gh<_i45.AddToWishListUseCase>(),
          gh<_i53.RemoveFromWishListUseCase>(),
          gh<_i49.GetAllProductsWithFiltrationUseCase>(),
          gh<_i89.GetCartUseCase>(),
          gh<_i88.AddToCartUseCase>(),
          gh<_i90.RemoveFromCartUseCase>(),
          gh<_i91.UpdateProductInCartUseCase>(),
          gh<_i41.MainRepo>(),
        ));
    return this;
  }
}
