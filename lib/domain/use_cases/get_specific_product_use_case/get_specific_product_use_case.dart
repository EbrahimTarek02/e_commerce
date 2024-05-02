import 'package:e_commerce/data/model/specific_product_response/specific_product_response.dart';
import 'package:e_commerce/domain/repos/get_specific_product_repos/get_specific_product_repo.dart';
import 'package:e_commerce/ui/screens/main/main_states.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSpecificProductUseCase extends Cubit<MainStates> {
  GetSpecificProductRepo getSpecificProductRepo;

  GetSpecificProductUseCase(this.getSpecificProductRepo) : super(MainInitialState());

  Future<void> execute (String productID) async{
    emit(MainLoadingState());

    Either<String, SpecificProductResponse> response = await getSpecificProductRepo.getSpecificProduct(productID);

    response.fold((error) {
      emit(MainErrorState(error.toString()));
    }, (success) {
      emit(MainSuccessState<SpecificProductResponse>(success));
    });
  }
}