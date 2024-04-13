import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce/data/model/categories_response/CategoriesResponseDM.dart';
import 'package:e_commerce/data/model/products_response/products_response.dart';
import 'package:e_commerce/domain/repos/main_repos/main_repo.dart';
import 'package:e_commerce/domain/repos/main_repos/main_repo_ds.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MainRepo)
class MainRepoImpl extends MainRepo{

  MainRepoDS mainRepoDS;

  MainRepoImpl(this.mainRepoDS);

  @override
  Future<Either<String, CategoriesResponseDm>> getAllCategories() async{
    final ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi){
      return mainRepoDS.getAllCategories();
    }
    else{
      return const Left("Please check your internet connection and try again later");
    }
  }

  @override
  Future<Either<String, ProductsResponseDM>> getAllProducts() async{
    final ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi){
      return mainRepoDS.getAllProducts();
    }
    else{
      return const Left("Please check your internet connection and try again later");
    }
  }

}