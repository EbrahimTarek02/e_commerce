import 'package:e_commerce/data/model/brands_response/brands_response_DM.dart';
import 'package:e_commerce/data/model/categories_response/categories_response_DM.dart';
import 'package:e_commerce/data/model/get_wish_list_response/get_wish_list_response.dart';
import 'package:e_commerce/data/model/products_response/products_response.dart';
import 'package:either_dart/either.dart';

abstract class MainRepo {
  Future<Either<String, CategoriesResponseDm>> getAllCategories();

  Future<Either<String, ProductsResponseDM>> getAllProducts({
    String? brandID,
    String? categoryID,
    int priceLessThan = 99999,
    int priceGreaterThan = 0,
    bool? sortLowToHeightPrice
  });

  Future<Either<String, BrandsResponseDm>> getAllBrands();

  Future<Either<String, GetWishListResponse>> getWishList();

  Future<String?> addToWishList(String productID);

  Future<String?> removeFromWishList(String productID);
}