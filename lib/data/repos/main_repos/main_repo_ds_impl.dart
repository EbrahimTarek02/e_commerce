import 'dart:convert';
import 'package:e_commerce/data/model/brands_response/brands_response_DM.dart';
import 'package:e_commerce/data/model/categories_response/categories_response_DM.dart';
import 'package:e_commerce/data/model/get_wish_list_response/get_wish_list_response.dart';
import 'package:e_commerce/data/model/products_response/products_response.dart';
import 'package:e_commerce/data/utils/shared_prefs_utils.dart';
import 'package:e_commerce/domain/di/di.dart';
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
    String? categoryID,
    int priceLessThan = 99999,
    int priceGreaterThan = 0,
    bool? sortLowToHeightPrice
  }) async{

    String baseUrl = "ecommerce.routemisr.com";
    String endPoint = "api/v1/products";

    try{
      Uri uri;

      if (categoryID != null) {
        if (brandID != null) {
          if (sortLowToHeightPrice != null) {
            uri = Uri.https(
                baseUrl,
                endPoint,
                {
                  'category[in]' : categoryID,
                  'price[gte]' : priceGreaterThan.toString(),
                  'price[lte]' : priceLessThan.toString(),
                  'brand' : brandID,
                  'sort' : sortLowToHeightPrice ? "+price" : "-price"
                }
            );
          }
          else {
            uri = Uri.https(
                baseUrl,
                endPoint,
                {
                  'category[in]' : categoryID,
                  'price[gte]' : priceGreaterThan.toString(),
                  'price[lte]' : priceLessThan.toString(),
                  'brand' : brandID
                }
            );
          }
        }
        else {
          if (sortLowToHeightPrice != null) {
            uri = Uri.https(
                baseUrl,
                endPoint,
                {
                  'category[in]' : categoryID,
                  'price[gte]' : priceGreaterThan.toString(),
                  'price[lte]' : priceLessThan.toString(),
                  'sort' : sortLowToHeightPrice ? "+price" : "-price"
                }
            );
          }
          else {
            uri = Uri.https(
                baseUrl,
                endPoint,
                {
                  'category[in]' : categoryID,
                  'price[gte]' : priceGreaterThan.toString(),
                  'price[lte]' : priceLessThan.toString(),
                }
            );
          }
        }
      }
      else if (brandID != null) {
        if (sortLowToHeightPrice != null) {
          uri = Uri.https(
              baseUrl,
              endPoint,
              {
                'brand' : brandID,
                'price[gte]' : priceGreaterThan.toString(),
                'price[lte]' : priceLessThan.toString(),
                'sort' : sortLowToHeightPrice ? "+price" : "-price"
              }
          );
        }
        else {
          uri = Uri.https(
              baseUrl,
              endPoint,
              {
                'brand' : brandID,
                'price[gte]' : priceGreaterThan.toString(),
                'price[lte]' : priceLessThan.toString(),
              }
          );
        }
      }
      else if (sortLowToHeightPrice != null){
        uri = Uri.https(
            baseUrl,
            endPoint,
            {
              'price[gte]' : priceGreaterThan.toString(),
              'price[lte]' : priceLessThan.toString(),
              'sort' : sortLowToHeightPrice ? "+price" : "-price"
            }
        );
      }
      else {
        uri = Uri.https(
          baseUrl,
          endPoint,
          {
            'price[gte]' : priceGreaterThan.toString(),
            'price[lte]' : priceLessThan.toString(),
          }
        );
      }

      String request = uri.toString().replaceAll("%2B", "+");

      Response response = await get(Uri.parse(request));

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

  @override
  Future<Either<String, GetWishListResponse>> getWishList() async{
    String baseUrl = "ecommerce.routemisr.com";
    String endPoint = "api/v1/wishlist";

    try{

      SharedPrefsUtils sharedPrefsUtils = getIt<SharedPrefsUtils>();
      String? userToken = await sharedPrefsUtils.getToken();

      Uri uri = Uri.https(baseUrl, endPoint);
      Response response = await get(
        uri,
        headers: {
          "token" : userToken!
        }
      );

      GetWishListResponse getWishListResponse = GetWishListResponse.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300 && getWishListResponse.wishList != null) {
        return Right(getWishListResponse);
      }
      else{
        return Left(getWishListResponse.message ?? "Something went wrong please try again latter");
      }
    }
    catch(_) {
      return const Left("Something went wrong please try again latter");
    }
  }

  @override
  Future<String?> addToWishList(String productID) async{
    String baseUrl = "ecommerce.routemisr.com";
    String endPoint = "api/v1/wishlist";

    try{

      SharedPrefsUtils sharedPrefsUtils = getIt<SharedPrefsUtils>();
      String? userToken = await sharedPrefsUtils.getToken();

      Uri uri = Uri.https(baseUrl, endPoint);
      Response response = await post(
          uri,
          headers: {
            "token" : userToken!
          },
          body: {
            "productId" : productID
          }
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return null;
      }
      else{
        return "Something went wrong please try again latter";
      }
    }
    catch(_) {
      return "Something went wrong please try again latter";
    }
  }

  @override
  Future<String?> removeFromWishList(String productID) async{
    String baseUrl = "ecommerce.routemisr.com";
    String endPoint = "api/v1/wishlist/$productID";

    try{

      SharedPrefsUtils sharedPrefsUtils = getIt<SharedPrefsUtils>();
      String? userToken = await sharedPrefsUtils.getToken();

      Uri uri = Uri.https(baseUrl, endPoint);
      Response response = await delete(
          uri,
          headers: {
            "token" : userToken!
          }
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return null;
      }
      else{
        return "Something went wrong please try again latter";
      }
    }
    catch(_) {
      return "Something went wrong please try again latter";
    }
  }

}