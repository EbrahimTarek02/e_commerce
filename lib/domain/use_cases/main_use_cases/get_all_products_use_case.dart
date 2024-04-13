import 'package:e_commerce/data/model/products_response/products_response.dart';
import 'package:e_commerce/domain/repos/main_repos/main_repo.dart';
import 'package:e_commerce/ui/screens/main/main_states.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllProductsUseCase extends Cubit<MainStates> {
  MainRepo mainRepo;
  ProductsResponseDM allProducts = ProductsResponseDM();

  GetAllProductsUseCase(this.mainRepo) : super(MainLoadingState());

  Future<void> execute() async{

    Either<String, ProductsResponseDM> response = await mainRepo.getAllProducts();
    response.fold((error) {
      emit(MainErrorState(error));
    }, (success) {
      allProducts = success;
      emit(MainSuccessState<ProductsResponseDM>(success));
    });
  }
}