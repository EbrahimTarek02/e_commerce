import 'package:e_commerce/data/model/categories_response/CategoriesResponseDM.dart';
import 'package:e_commerce/domain/repos/main_repos/main_repo.dart';
import 'package:e_commerce/ui/screens/main/main_states.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllCategoriesUseCase extends Cubit<MainStates> {
  MainRepo mainRepo;
  CategoriesResponseDm allCategories = CategoriesResponseDm();

  GetAllCategoriesUseCase(this.mainRepo) : super(MainLoadingState());

  Future<void> execute() async{

    Either<String, CategoriesResponseDm> response = await mainRepo.getAllCategories();
    response.fold((error) {
      emit(MainErrorState(error));
    }, (success) {
      allCategories = success;
      emit(MainSuccessState<CategoriesResponseDm>(success));
    });
  }
}