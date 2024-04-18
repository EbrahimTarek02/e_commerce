import 'package:e_commerce/data/model/get_wish_list_response/get_wish_list_response.dart';
import 'package:e_commerce/domain/repos/main_repos/main_repo.dart';
import 'package:e_commerce/ui/screens/main/main_states.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetWishListUseCase extends Cubit<MainStates>{
  MainRepo mainRepo;

  GetWishListUseCase(this.mainRepo) : super(MainInitialState());

  Future<Either<String, GetWishListResponse>> execute() async{
    return await mainRepo.getWishList();
  }
}