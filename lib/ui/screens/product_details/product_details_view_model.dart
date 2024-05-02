import 'package:e_commerce/domain/use_cases/get_specific_product_use_case/get_specific_product_use_case.dart';
import 'package:e_commerce/ui/screens/product_details/product_details_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductDetailsViewModel extends Cubit<ProductDetailsStates> {
  GetSpecificProductUseCase getSpecificProductUseCase;

  ProductDetailsViewModel(this.getSpecificProductUseCase) : super(InitialState());

  void getProductDetails(String productID) async{
    await getSpecificProductUseCase.execute(productID);
  }

  int productCount = 1;

  void addProduct(int available) {
    if (productCount < available){
      productCount++;
    }
    emit(ChangeCounterState());
  }

  void removeProduct() {
    if (productCount > 0){
      productCount--;
    }
    emit(ChangeCounterState());
  }

  bool textIsVisible = false;

  void changeTextVisibility() {
    textIsVisible = !textIsVisible;
    emit(ChangeTextVisibilityState());
  }
}