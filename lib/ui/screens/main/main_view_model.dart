import 'package:e_commerce/data/model/get_wish_list_response/get_wish_list_response.dart';
import 'package:e_commerce/data/model/products_response/products_response.dart';
import 'package:e_commerce/domain/use_cases/main_use_cases/add_to_wish_list_use_case.dart';
import 'package:e_commerce/domain/use_cases/main_use_cases/get_all_brands_use_case.dart';
import 'package:e_commerce/domain/use_cases/main_use_cases/get_all_categories_use_case.dart';
import 'package:e_commerce/domain/use_cases/main_use_cases/get_all_products_use_case.dart';
import 'package:e_commerce/domain/use_cases/main_use_cases/get_products_with_brand_id_use_case.dart';
import 'package:e_commerce/domain/use_cases/main_use_cases/get_products_with_category_id_use_case.dart';
import 'package:e_commerce/domain/use_cases/main_use_cases/get_wish_list_use_case.dart';
import 'package:e_commerce/domain/use_cases/main_use_cases/remove_from_wish_list_use_case.dart';
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

  MainViewModel(
      this.getAllCategoriesUseCase,
      this.getAllProductsUseCase,
      this.getAllBrandsUseCase,
      this.getProductsWithBrandIDUseCase,
      this.getProductsWithCategoryIDUseCase,
      this.getWishListUseCase,
      this.addToWishListUseCase,
      this.removeFromWishListUseCase)
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

  Future<void> getProductsWithBrandID(String brandID) async {
    await getProductsWithBrandIDUseCase.execute(brandID);
  }

  Future<void> getProductsWithCategoryID(String categoryID) async {
    await getProductsWithCategoryIDUseCase.execute(categoryID);
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

  Future<void> addToWishList(Product product) async {
    String? response =  await addToWishListUseCase.execute(product.id ?? "");
    emit(MainLoadingState());
    if (response == null){
      wishListProducts.add(product);
      wishList.add(product.id ?? "");
      emit(MainSuccessState(null));
    }
    else {
      emit(MainErrorState(response));
    }
  }

  Future<void> removeFromWishList(Product product) async {
    String? response = await removeFromWishListUseCase.execute(product.id ?? "");
    emit(MainLoadingState());
    if (response == null){
      wishListProducts.remove(product);
      wishList.remove(product.id ?? "");
      emit(MainSuccessState(null));
    }
    else {
      emit(MainErrorState(response));
    }
  }
}
