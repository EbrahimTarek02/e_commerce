import 'package:e_commerce/domain/repos/main_repos/main_repo.dart';
import 'package:e_commerce/ui/screens/main/main_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveFromWishListUseCase extends Cubit<MainStates>{
  MainRepo mainRepo;

  RemoveFromWishListUseCase(this.mainRepo) : super(MainInitialState());

  Future<String?> execute(String productID) async {
    return mainRepo.removeFromWishList(productID);
  }
}