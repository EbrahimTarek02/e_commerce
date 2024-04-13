import 'package:e_commerce/data/model/categories_response/CategoriesResponseDM.dart';
import 'package:e_commerce/data/model/products_response/products_response.dart';
import 'package:either_dart/either.dart';

abstract class MainRepoDS {
  Future<Either<String, CategoriesResponseDm>> getAllCategories();

  Future<Either<String, ProductsResponseDM>> getAllProducts();
}