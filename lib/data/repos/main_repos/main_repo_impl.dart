import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce/data/model/brands_response/brands_response_DM.dart';
import 'package:e_commerce/data/model/categories_response/categories_response_DM.dart';
import 'package:e_commerce/data/model/get_wish_list_response/get_wish_list_response.dart';
import 'package:e_commerce/data/model/products_response/products_response.dart';
import 'package:e_commerce/domain/repos/main_repos/main_repo.dart';
import 'package:e_commerce/domain/repos/main_repos/main_repo_ds.dart';
import 'package:e_commerce/ui/utils/constants.dart';
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
      return const Left(Constants.networkErrorMessage);
    }
  }

  @override
  Future<Either<String, ProductsResponseDM>> getAllProducts({
    String? brandID,
    String? categoryID,
    int priceLessThan = 99999,
    int priceGreaterThan = 0,
    bool? sortLowToHeightPrice
  }) async{

    final ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi){
      return mainRepoDS.getAllProducts(
        brandID: brandID,
        categoryID: categoryID,
        priceLessThan: priceLessThan,
        priceGreaterThan: priceGreaterThan,
        sortLowToHeightPrice: sortLowToHeightPrice
      );
    }
    else{
      return const Left(Constants.networkErrorMessage);
    }
  }

  @override
  Future<Either<String, BrandsResponseDm>> getAllBrands() async{
    final ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi){
      return mainRepoDS.getAllBrands();
    }
    else{
      return const Left(Constants.networkErrorMessage);
    }
  }

  @override
  Future<Either<String, GetWishListResponse>> getWishList() async{
    final ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi){
      return mainRepoDS.getWishList();
    }
    else{
      return const Left(Constants.networkErrorMessage);
    }
  }

  @override
  Future<String?> addToWishList(String productID) async{
    final ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi){
      return mainRepoDS.addToWishList(productID);
    }
    else{
      return Constants.networkErrorMessage;
    }
  }

  @override
  Future<String?> removeFromWishList(String productID) async{
    final ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi){
      return mainRepoDS.removeFromWishList(productID);
    }
    else{
      return Constants.networkErrorMessage;
    }
  }

}