import 'package:e_commerce/ui/screens/products_of_category/products_of_category_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsOfCategoryViewModel extends Cubit<ProductsOfCategoryStates> {
  ProductsOfCategoryViewModel() : super(ProductsOfCategoryInitialState());

  int? selectedBrand;

  void changeRadioButton(int brand) {
    if (selectedBrand != null && selectedBrand == brand) {
      selectedBrand = null;
    }
    else {
      selectedBrand = brand;
    }
    emit(ProductsOfCategoryInitialState());
  }

  int? selectedSortingType;

  void changeSortingType(int sortingType) {
    if (selectedSortingType!= null && selectedSortingType == sortingType) {
      selectedSortingType = null;
    }
    else{
      selectedSortingType = sortingType;
    }
    emit(ProductsOfCategoryInitialState());
  }

}