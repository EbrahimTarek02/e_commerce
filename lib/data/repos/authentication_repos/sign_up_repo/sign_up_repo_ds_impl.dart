import 'dart:convert';
import 'package:e_commerce/data/model/authentication_response/authentication_response.dart';
import 'package:e_commerce/data/model/sign_up_request/sign_up_request_data_model.dart';
import 'package:e_commerce/data/utils/shared_prefs_utils.dart';
import 'package:e_commerce/domain/repos/authentication_repos/sign_up_repo/sign_up_repo_ds.dart';
import 'package:either_dart/either.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignUpRepoDS)
class SignUpRepoDSImpl extends SignUpRepoDS{

  SharedPrefsUtils sharedPrefsUtils;

  SignUpRepoDSImpl(this.sharedPrefsUtils);

  @override
  Future<Either<String, AuthenticationResponse>> signUp(
      String name, String phoneNumber, String email, String password, String rePassword
      ) async{

    String baseUrl = "ecommerce.routemisr.com";
    String endPoint = "api/v1/auth/signup";

    try {
      Uri uri = Uri.https(baseUrl, endPoint);
      Response response = await post(
        uri,
        body: SignUpRequestDataModel(
          name: name,
          phoneNumber: phoneNumber,
          email: email,
          password: password,
          rePassword: rePassword
        ).toJson()
      );

      AuthenticationResponse authenticationResponse = AuthenticationResponse.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {

        authenticationResponse.user!.password = password;
        sharedPrefsUtils.setUser(authenticationResponse.user!);
        sharedPrefsUtils.setToken(authenticationResponse.token!);

        return Right(authenticationResponse);
      }
      else {
        return Left(authenticationResponse.message ?? "Something went wrong please try again later.");
      }
    }
    catch(_) {
      return const Left("Something went wrong please try again latter");
    }
  }
}