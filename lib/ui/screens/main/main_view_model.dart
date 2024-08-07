import 'dart:async';
import 'package:e_commerce/data/model/cart_response/cart_response_DM.dart';
import 'package:e_commerce/data/model/get_wish_list_response/get_wish_list_response.dart';
import 'package:e_commerce/data/model/products_response/products_response.dart';
import 'package:e_commerce/domain/repos/main_repos/main_repo.dart';
import 'package:e_commerce/domain/use_cases/cart_use_cases/add_to_cart_use_case.dart';
import 'package:e_commerce/domain/use_cases/cart_use_cases/get_cart_use_case.dart';
import 'package:e_commerce/domain/use_cases/cart_use_cases/remove_from_cart_use_case.dart';
import 'package:e_commerce/domain/use_cases/cart_use_cases/update_product_in_cart_use_case.dart';
import 'package:e_commerce/domain/use_cases/main_use_cases/add_to_wish_list_use_case.dart';
import 'package:e_commerce/domain/use_cases/main_use_cases/get_all_brands_use_case.dart';
import 'package:e_commerce/domain/use_cases/main_use_cases/get_all_categories_use_case.dart';
import 'package:e_commerce/domain/use_cases/main_use_cases/get_all_products_use_case.dart';
import 'package:e_commerce/domain/use_cases/main_use_cases/get_all_products_with_filtration_use_case.dart';
import 'package:e_commerce/domain/use_cases/main_use_cases/get_products_with_brand_id_use_case.dart';
import 'package:e_commerce/domain/use_cases/main_use_cases/get_products_with_category_id_use_case.dart';
import 'package:e_commerce/domain/use_cases/main_use_cases/get_wish_list_use_case.dart';
import 'package:e_commerce/domain/use_cases/main_use_cases/remove_from_wish_list_use_case.dart';
import 'package:e_commerce/ui/screens/cart/cart_view_model.dart';
import 'package:e_commerce/ui/screens/main/main_states.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class MainViewModel extends Cubit<MainStates> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllProductsUseCase getAllProductsUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase;
  GetProductsWithBrandIDUseCase getProductsWithBrandIDUseCase;
  GetProductsWithCategoryIDUseCase getProductsWithCategoryIDUseCase;
  GetWishListUseCase getWishListUseCase;
  AddToWishListUseCase addToWishListUseCase;
  RemoveFromWishListUseCase removeFromWishListUseCase;
  GetAllProductsWithFiltrationUseCase getAllProductsWithFiltrationUseCase;
  GetCartUseCase getCartUseCase;
  AddToCartUseCase addToCartUseCase;
  RemoveFromCartUseCase removeFromCartUseCase;
  UpdateProductInCartUseCase updateProductInCartUseCase;
  MainRepo mainRepo;
  bool? navigate;

  MainViewModel(
      this.getAllCategoriesUseCase,
      this.getAllProductsUseCase,
      this.getAllBrandsUseCase,
      this.getProductsWithBrandIDUseCase,
      this.getProductsWithCategoryIDUseCase,
      this.getWishListUseCase,
      this.addToWishListUseCase,
      this.removeFromWishListUseCase,
      this.getAllProductsWithFiltrationUseCase,
      this.getCartUseCase,
      this.addToCartUseCase,
      this.removeFromCartUseCase,
      this.updateProductInCartUseCase,
      this.mainRepo)
      : super(MainInitialState());

  int currentIndex = 0;

  void changeBottomNavBarIndex(int newIndex) {
    currentIndex = newIndex;
    emit(MainChangeBottomNavBarIndexState());
  }

  Future<void> getAllCategories() async {
    await getAllCategoriesUseCase.execute();
  }

  Future<void> getAllProducts() async {
    await getAllProductsUseCase.execute();
  }

  Future<void> getAllProductsWithFiltration({
    String? brandID,
    String? categoryID,
    int priceLessThan = 99999,
    int priceGreaterThan = 0,
    bool? sortLowToHeightPrice
  }) async {

    await getAllProductsWithFiltrationUseCase.execute(
        brandID: brandID,
        categoryID: categoryID,
        priceLessThan: priceLessThan,
        priceGreaterThan: priceGreaterThan,
        sortLowToHeightPrice: sortLowToHeightPrice
    );
  }

  Future<void> getProductsWithBrandID(String brandID) async {
    await getProductsWithBrandIDUseCase.execute(brandID);
  }

  Future<void> getProductsWithCategoryID(String categoryID, bool updateData, {
    int priceLessThan = 99999,
    int priceGreaterThan = 0,
    String? brandID,
    bool? sortLowToHeightPrice
}) async {

    if (brandID != null) {
      if (sortLowToHeightPrice != null) {
        await getProductsWithCategoryIDUseCase.execute(categoryID, updateData, priceLessThan: priceLessThan, priceGreaterThan: priceGreaterThan, brandID: brandID, sortLowToHeightPrice: sortLowToHeightPrice);
      }
      else {
        await getProductsWithCategoryIDUseCase.execute(categoryID, updateData, priceLessThan: priceLessThan, priceGreaterThan: priceGreaterThan, brandID: brandID);
      }
    }
    else {
      if (sortLowToHeightPrice != null) {
        await getProductsWithCategoryIDUseCase.execute(categoryID, updateData, priceLessThan: priceLessThan, priceGreaterThan: priceGreaterThan, sortLowToHeightPrice: sortLowToHeightPrice);
      }
      else {
        await getProductsWithCategoryIDUseCase.execute(categoryID, updateData, priceLessThan: priceLessThan, priceGreaterThan: priceGreaterThan);
      }
    }
  }

  Future<void> getAllBrands() async {
    await getAllBrandsUseCase.execute();
  }

  static Set<String> wishList = {};
  static Set<Product> wishListProducts = {};

  Future<void> getWishList() async {
    emit(MainLoadingState());

    Either<String, GetWishListResponse> response = await getWishListUseCase.execute();

    response.fold((error) {
      emit(MainErrorState(error));
    }, (success) {
      for (Product product in success.wishList!) {
        wishList.add(product.id!);
      }
      wishListProducts = success.wishList!.toSet();
      emit(MainSuccessState<GetWishListResponse>(success));
    });
  }

  late bool isInWishList;

  Future<void> addToWishList(Product product, bool loadData) async {
    if (loadData) {
      emit(WishIconLoadingState());
    }
    String? response =  await addToWishListUseCase.execute(product.id ?? "");
    if (response == null){
      wishListProducts.add(product);
      wishList.add(product.id ?? "");
      isInWishList = true;
      emit(MainSuccessState(null));
    }
    else {
      emit(MainErrorState(response));
    }
  }

  Future<void> removeFromWishList(Product product, bool loadData) async {
    if (loadData) {
      emit(WishIconLoadingState());
    }
    String? response = await removeFromWishListUseCase.execute(product.id ?? "");
    if (response == null){
      wishListProducts.remove(product);
      wishList.remove(product.id ?? "");
      isInWishList = false;
      emit(MainSuccessState(null));
    }
    else {
      emit(MainErrorState(response));
    }
  }

  static Set<String> cartIDs = {};
  static Set<CartProducts> cartProducts = {};

  Future<void> getCart() async{
    emit(MainLoadingState());

    cartIDs.clear();
    cartProducts.clear();

    Either<String, CartResponseDm> response = await getCartUseCase.getCart();

    response.fold((error) {
      navigate = false;
      emit(MainErrorState(error));
    }, (success) {
      for (CartProducts cartProduct in success.cart!.cartProducts!) {
        cartIDs.add(cartProduct.product!.id!);
      }
      cartProducts = success.cart!.cartProducts!.toSet();
      emit(MainSuccessState<CartResponseDm>(success));
    });
  }

  late bool isInCart;

  Future<void> addToCart(String productID, bool loadData, int productCount) async{
    if (loadData){
      emit(CartIconLoadingState());
    }

    Either<String, CartResponseDm> response = await addToCartUseCase.execute(productID);

    response.fold((error) {
      emit(MainErrorState(error));
    }, (success) {
      cartIDs.add(productID);
      cartProducts = success.cart!.cartProducts!.toSet();
      isInCart = true;
      if (productCount > 1) {
        updateProductInCart(productID, productCount);
      }
      else{
        emit(MainSuccessState(success));
      }
    });
  }

  Future<void> removeFromCart(String productID, bool loadData) async{
    if (loadData){
      emit(CartIconLoadingState());
    }

    Either<String, CartResponseDm> response = await removeFromCartUseCase.execute(productID);

    response.fold((error) {
      emit(MainErrorState(error));
    }, (success) {
      cartIDs.remove(productID);
      cartProducts = success.cart!.cartProducts!.toSet();
      CartViewModel.updatedProducts.remove(productID);
      isInCart = false;
      emit(MainSuccessState(success));
    });
  }

  Future<void> updateProductInCart(String productID, int productCount) async{

    Either<String, CartResponseDm> response = await updateProductInCartUseCase.execute(productID, productCount);

    response.fold((error) {
      emit(MainErrorState(error));
    }, (success) {
      emit(MainSuccessState(success));
    });
  }

  Future<void> prepareAppDate() async{
    await getWishList().then((_) async{
      await getCart().then((_) async {
        await getAllProducts();
        await getAllCategories();
        await getAllBrands();
      });
    });
  }
}
