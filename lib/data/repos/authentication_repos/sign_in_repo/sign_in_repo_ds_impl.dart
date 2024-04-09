import 'dart:convert';
import 'package:e_commerce/data/model/authentication_response/authentication_response.dart';
import 'package:e_commerce/data/model/sign_in_request/sign_in_request_data_model.dart';
import 'package:e_commerce/data/utils/shared_prefs_utils.dart';
import 'package:e_commerce/domain/repos/authentication_repos/sign_in_repo/sign_in_repo_ds.dart';
import 'package:either_dart/either.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignInRepoDS)
class SignInRepoDSImpl extends SignInRepoDS {

  SharedPrefsUtils sharedPrefsUtils;

  SignInRepoDSImpl(this.sharedPrefsUtils);

  @override
  Future<Either<String, AuthenticationResponse>> signIn(String email, String password) async{

    String baseUrl = "ecommerce.routemisr.com";
    String endPoint = "api/v1/auth/signin";

    try {
      Uri uri = Uri.https(baseUrl, endPoint);
      Response response = await post(
          uri,
          body: SignInRequestDataModel(
              email: email,
              password: password
          ).toJson()
      );

      AuthenticationResponse authenticationResponse = AuthenticationResponse.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {

        sharedPrefsUtils.setUser(authenticationResponse.user!);
        sharedPrefsUtils.setToken(authenticationResponse.token!);

        return Right(authenticationResponse);
      }
      else {
        return Left(authenticationResponse.message ?? "Something went wrong please try again latter");
      }
    }
    catch(_) {
      return const Left("Something went wrong please try again latter");
    }
  }
}