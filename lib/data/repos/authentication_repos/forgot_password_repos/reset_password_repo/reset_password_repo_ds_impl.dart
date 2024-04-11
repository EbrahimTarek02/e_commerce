import 'dart:convert';
import 'package:e_commerce/data/model/forgot_password_response/forgot_password_response.dart';
import 'package:e_commerce/domain/repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo_ds.dart';
import 'package:either_dart/either.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ResetPasswordRepoDS)
class ResetPasswordRepoDSImpl extends ResetPasswordRepoDS{
  @override
  Future<Either<String, bool>> resetPassword(String email, String newPassword) async{
    String baseUrl = "ecommerce.routemisr.com";
    String endPoint = "api/v1/auth/resetPassword";

    try {
      Uri uri = Uri.https(baseUrl, endPoint);

      Response response = await put(
        uri,
        body: {
          "email" : email,
          "newPassword" : newPassword
        }
      );

      ForgotPasswordResponse forgotPasswordResponse = ForgotPasswordResponse.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return const Right(true);
      }
      else{
        return Left(forgotPasswordResponse.message ?? "Something went wrong please try again latter");
      }
    }
    catch (_) {
      return const Left("Something went wrong please try again latter");
    }
  }

}