import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce/data/model/specific_product_response/specific_product_response.dart';
import 'package:e_commerce/domain/repos/get_specific_product_repos/get_specific_product_repo.dart';
import 'package:e_commerce/domain/repos/get_specific_product_repos/get_specific_product_repo_ds.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetSpecificProductRepo)
class GetSpecificProductRepoImpl extends GetSpecificProductRepo {

  GetSpecificProductRepoDS getSpecificProductRepoDS;

  GetSpecificProductRepoImpl(this.getSpecificProductRepoDS);

  @override
  Future<Either<String, SpecificProductResponse>> getSpecificProduct(String productID) async{
    final ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi){
      return getSpecificProductRepoDS.getSpecificProduct(productID);
    }
    else{
      return const Left("Please check your internet connection and try again later");
    }
  }
}