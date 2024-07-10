import 'package:e_commerce/data/model/brands_response/brands_response_DM.dart';
import 'package:e_commerce/domain/repos/main_repos/main_repo.dart';
import 'package:e_commerce/ui/screens/main/main_states.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllBrandsUseCase extends Cubit<MainStates>{
  MainRepo mainRepo;

  GetAllBrandsUseCase(this.mainRepo) : super(MainLoadingState());

  Future<void> execute() async{
    emit(MainLoadingState());

    Either<String, BrandsResponseDm> response = await mainRepo.getAllBrands();
    response.fold((error) {
      emit(MainErrorState(error));
    }, (success) {
      emit(MainSuccessState<BrandsResponseDm>(success));
    });
  }
}