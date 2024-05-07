import 'package:e_commerce/data/model/products_response/products_response.dart';
import 'package:e_commerce/domain/repos/main_repos/main_repo.dart';
import 'package:e_commerce/ui/screens/main/main_states.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsWithCategoryIDUseCase extends Cubit<MainStates> {
  MainRepo mainRepo;
  static Set<String> categoryBrands = {};
  static Set<String> categoryBrandIDs = {};
  static int maxPrice = 0;
  static int minPrice = 999999;

  GetProductsWithCategoryIDUseCase(this.mainRepo) : super(MainLoadingState());

  Future<void> execute(String categoryID, bool updateData,
      {int priceLessThan = 99999, int priceGreaterThan = 0, String? brandID, bool? sortLowToHeightPrice}) async{

    emit(MainLoadingState());

    Either<String, ProductsResponseDM> response;

    if (brandID != null) {
      if (sortLowToHeightPrice != null) {
        response = await mainRepo.getAllProducts(categoryID: categoryID, priceLessThan: priceLessThan, priceGreaterThan: priceGreaterThan, brandID: brandID, sortLowToHeightPrice: sortLowToHeightPrice);
      }
      else {
        response = await mainRepo.getAllProducts(categoryID: categoryID, priceLessThan: priceLessThan, priceGreaterThan: priceGreaterThan, brandID: brandID);
      }
    }
    else {
      if (sortLowToHeightPrice != null) {
        response = await mainRepo.getAllProducts(categoryID: categoryID, priceLessThan: priceLessThan, priceGreaterThan: priceGreaterThan, sortLowToHeightPrice: sortLowToHeightPrice);
      }
      else {
        response = await mainRepo.getAllProducts(categoryID: categoryID, priceLessThan: priceLessThan, priceGreaterThan: priceGreaterThan);
      }
    }

    response.fold((error) {
      emit(MainErrorState(error));
    }, (success) {
      if (updateData) {
        categoryBrands.clear();
        categoryBrandIDs.clear();
        maxPrice = 0;
        minPrice = 999999;

        for (Product product in success.products!) {
          if (product.brand != null && product.brand!.name != null){
            categoryBrands.add(product.brand!.name!);
            categoryBrandIDs.add(product.brand!.id!);
          }

          if (product.price! < minPrice) {
            minPrice = product.price!.floor();
          }

          if (product.price! > maxPrice) {
            maxPrice = product.price!.ceil();
          }
        }
      }
      emit(MainSuccessState<ProductsResponseDM>(success));
    });
  }
}