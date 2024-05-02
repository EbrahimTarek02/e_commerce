import 'dart:convert';
import 'package:e_commerce/data/model/specific_product_response/specific_product_response.dart';
import 'package:e_commerce/domain/repos/get_specific_product_repos/get_specific_product_repo_ds.dart';
import 'package:either_dart/either.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetSpecificProductRepoDS)
class GetSpecificProductRepoDSImpl extends GetSpecificProductRepoDS {
  @override
  Future<Either<String, SpecificProductResponse>> getSpecificProduct(String productID) async{
    String baseUrl = "ecommerce.routemisr.com";
    String endPoint = "api/v1/products/$productID";

    try {
      Uri uri = Uri.https(baseUrl, endPoint);

      Response response = await get(uri);

      SpecificProductResponse specificProductResponse = SpecificProductResponse.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300 && specificProductResponse.product != null) {
        return Right(specificProductResponse);
      }
      else {
        return const Left("Something went wrong please try again later");
      }

    } catch (_) {
      return const Left("Something went wrong please try again later");
    }
  }

}