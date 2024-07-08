import 'package:e_commerce/data/model/categories_response/categories_response_DM.dart';
import 'package:e_commerce/data/model/products_response/products_response.dart';
import 'package:e_commerce/ui/screens/all_products/all_products_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AllProductsViewModel extends Cubit<AllProductsStates> {

  AllProductsViewModel() : super(AllProductsInitialState());

  int? selectedCategory;

  void changeCategoriesRadioButton(int category) {
    if (selectedCategory != null && selectedCategory == category) {
      selectedCategory = null;
    }
    else {
      selectedCategory = category;
    }
    emit(AllProductsInitialState());
  }

  int? selectedBrand;

  void changeBrandsRadioButton(int brand) {
    if (selectedBrand != null && selectedBrand == brand) {
      selectedBrand = null;
    }
    else {
      selectedBrand = brand;
    }
    emit(AllProductsInitialState());
  }

  int? selectedSortingType;

  void changeSortingType(int sortingType) {
    if (selectedSortingType!= null && selectedSortingType == sortingType) {
      selectedSortingType = null;
    }
    else{
      selectedSortingType = sortingType;
    }
    emit(AllProductsInitialState());
  }

  List<Brand> brands = [];

  void updateBrandsCount(List<Brand> newBrands) {
    brands =  newBrands;
    emit(AllProductsInitialState());
  }

  List<Category> categories = [];

  void updateCategoriesCount(List<Category> newCategories) {
    categories =  newCategories;
    emit(AllProductsInitialState());
  }
}