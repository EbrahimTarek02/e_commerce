import 'dart:convert';
import 'package:e_commerce/data/model/forgot_password_response/forgot_password_response.dart';
import 'package:e_commerce/domain/repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo_ds.dart';
import 'package:either_dart/either.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: VerifyEmailRepoDS)
class VerifyEmailRepoDSImpl extends VerifyEmailRepoDS{
  @override
  Future<Either<String, bool>> verifyEmail(String email) async{
    String baseUrl = "ecommerce.routemisr.com";
    String endPoint = "api/v1/auth/forgotPasswords";

    try {
      Uri uri = Uri.https(baseUrl, endPoint);

      Response response = await post(
        uri,
        body: {"email" : email}
      );

      ForgotPasswordResponse forgotPasswordResponse = ForgotPasswordResponse.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return const Right(true);
      }
      else {
        return Left(forgotPasswordResponse.message ?? "Something went wrong please try again latter");
      }
    }
    catch(_) {
      return const Left("Something went wrong please try again latter");
    }

  }

}