import 'package:e_commerce/data/model/brands_response/BrandsResponseDM.dart';
import 'package:e_commerce/data/model/categories_response/CategoriesResponseDM.dart';
import 'package:e_commerce/data/model/products_response/products_response.dart';
import 'package:either_dart/either.dart';

abstract class MainRepo {
  Future<Either<String, CategoriesResponseDm>> getAllCategories();

  Future<Either<String, ProductsResponseDM>> getAllProducts({
    String brandID,
    String categoryID
  });

  Future<Either<String, BrandsResponseDm>> getAllBrands();
}