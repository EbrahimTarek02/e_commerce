import 'dart:convert';
import 'package:e_commerce/data/model/brands_response/BrandsResponseDM.dart';
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
  Future<Either<String, ProductsResponseDM>> getAllProducts({
    String? brandID,
    String? categoryID
  }) async{
    String baseUrl = "ecommerce.routemisr.com";
    String endPoint = "api/v1/products";

    try{
      Uri uri;

      if (brandID != null) {
        uri = Uri.https(
            baseUrl,
            endPoint,
            {
              'brand' : brandID
            }
        );
      }
      else if (categoryID != null) {
        uri = Uri.https(
            baseUrl,
            endPoint,
            {
              'category[in]' : categoryID
            }
        );
      }
      else {
        uri = Uri.https(baseUrl, endPoint);
      }
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

  @override
  Future<Either<String, BrandsResponseDm>> getAllBrands() async{
    String baseUrl = "ecommerce.routemisr.com";
    String endPoint = "api/v1/brands";

    try{
      Uri uri = Uri.https(baseUrl, endPoint);
      Response response = await get(uri);

      BrandsResponseDm brandsResponseDm = BrandsResponseDm.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300 && brandsResponseDm.brands != null) {
        return Right(brandsResponseDm);
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