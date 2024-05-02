import 'package:e_commerce/data/model/specific_product_response/specific_product_response.dart';
import 'package:either_dart/either.dart';

abstract class GetSpecificProductRepoDS {
  Future<Either<String, SpecificProductResponse>> getSpecificProduct(String productID);
}