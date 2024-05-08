import 'package:e_commerce/data/model/products_response/products_response.dart';
import 'package:e_commerce/domain/repos/main_repos/main_repo.dart';
import 'package:e_commerce/ui/screens/main/main_states.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllProductsWithFiltrationUseCase extends Cubit<MainStates> {
  MainRepo mainRepo;

  GetAllProductsWithFiltrationUseCase(this.mainRepo) : super(MainInitialState());

  Future<void> execute({
    String? brandID,
    String? categoryID,
    int priceLessThan = 100000,
    int priceGreaterThan = 0,
    bool? sortLowToHeightPrice,
  }) async{

    emit(MainLoadingState());

    Either<String, ProductsResponseDM> response = await mainRepo.getAllProducts(
        brandID: brandID,
        categoryID: categoryID,
        priceLessThan: priceLessThan,
        priceGreaterThan: priceGreaterThan,
        sortLowToHeightPrice: sortLowToHeightPrice
    );

    response.fold((error) {
      emit(MainErrorState(error));
    }, (success) {
      emit(MainSuccessState<ProductsResponseDM>(success));
    });
  }
}