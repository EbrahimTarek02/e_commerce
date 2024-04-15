import 'package:e_commerce/domain/use_cases/main_use_cases/get_all_brands_use_case.dart';
import 'package:e_commerce/domain/use_cases/main_use_cases/get_all_categories_use_case.dart';
import 'package:e_commerce/domain/use_cases/main_use_cases/get_all_products_use_case.dart';
import 'package:e_commerce/domain/use_cases/main_use_cases/get_products_with_brand_id_use_case.dart';
import 'package:e_commerce/domain/use_cases/main_use_cases/get_products_with_category_id_use_case.dart';
import 'package:e_commerce/ui/screens/main/main_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class MainViewModel extends Cubit<MainStates> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllProductsUseCase getAllProductsUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase;
  GetProductsWithBrandIDUseCase getProductsWithBrandIDUseCase;
  GetProductsWithCategoryIDUseCase getProductsWithCategoryIDUseCase;

  MainViewModel(
      this.getAllCategoriesUseCase,
      this.getAllProductsUseCase,
      this.getAllBrandsUseCase,
      this.getProductsWithBrandIDUseCase,
      this.getProductsWithCategoryIDUseCase)
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
}