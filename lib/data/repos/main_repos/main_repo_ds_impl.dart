import 'dart:convert';
import 'package:e_commerce/data/model/categories_response/CategoriesResponseDM.dart';
import 'package:e_commerce/data/model/products_response/products_response.dart';
import 'package:e_commerce/domain/repos/main_repos/main_repo_ds.dart';
import 'package:either_dart/either.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MainRepoDS)
class MainRepoDSImpl extends MainRepoDS{
  @override
  Future<Either<String, CategoriesResponseDm>> getAllCategories() async{
    String baseUrl = "ecommerce.routemisr.com";
    String endPoint = "api/v1/categories";

    try{
      Uri uri = Uri.https(baseUrl, endPoint);
      Response response = await get(uri);

      CategoriesResponseDm categoriesResponseDm = CategoriesResponseDm.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300 && categoriesResponseDm.Categories != null) {
        return Right(categoriesResponseDm);
      }
      else{
        return const Left("Something went wrong please try again latter");
      }
    }
    catch(_) {
      return const Left("Something went wrong please try again latter");
    }
  }

  @override
  Future<Either<String, ProductsResponseDM>> getAllProducts() async{
    String baseUrl = "ecommerce.routemisr.com";
    String endPoint = "api/v1/products";

    try{
      Uri uri = Uri.https(baseUrl, endPoint);
      Response response = await get(uri);

      ProductsResponseDM productsResponse = ProductsResponseDM.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300 && productsResponse.products != null) {
        return Right(productsResponse);
      }
      else{
        return const Left("Something went wrong please try again latter");
      }
    }
    catch(_) {
      return const Left("Something went wrong please try again latter");
    }
  }

}