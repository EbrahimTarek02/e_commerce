import 'dart:convert';
import 'package:e_commerce/domain/repos/authentication_repos/forgot_password_repos/verify_sent_code_repo/verify_sent_code_repo_ds.dart';
import 'package:either_dart/either.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: VerifySentCodeRepoDS)
class VerifySentCodeRepoDSImpl extends VerifySentCodeRepoDS {
  @override
  Future<Either<String, bool>> verifySentCode(String code) async{
    String baseUrl = "ecommerce.routemisr.com";
    String endPoint = "api/v1/auth/verifyResetCode";

    try {
      Uri uri = Uri.https(baseUrl, endPoint);

      Response response = await post(
          uri,
          body: {"resetCode" : code}
      );

      Map<String, dynamic> verifySentCodeResponse = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return const Right(true);
      }
      else {
        return Left(verifySentCodeResponse["message"].toString());
      }
    }
    catch(_) {
      return const Left("Something went wrong please try again latter");
    }
  }

}