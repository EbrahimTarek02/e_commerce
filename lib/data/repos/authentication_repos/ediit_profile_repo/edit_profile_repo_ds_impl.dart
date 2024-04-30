import 'dart:convert';
import 'package:e_commerce/data/model/authentication_response/authentication_response.dart';
import 'package:e_commerce/domain/repos/authentication_repos/edit_profile_repo/edit_profile_repo_ds.dart';
import 'package:either_dart/either.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: EditProfileRepoDS)
class EditProfileRpoDSImpl extends EditProfileRepoDS {

  @override
  Future<Either<String, AuthenticationResponse>> editProfile(String name, String email, String token) async{
    String baseUrl = "ecommerce.routemisr.com";
    String endPoint = "api/v1/users/updateMe/";

    try {
      Uri uri = Uri.https(baseUrl, endPoint);

      Response response = await put(
          uri,
          headers: {
            "token" : token
          },
          body: {
            "name": name,
            "email": email,
            "phone": "01122935123" //virtual
          }
      );

      AuthenticationResponse authenticationResponse = AuthenticationResponse.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(authenticationResponse);
      }
      else {
        return Left(authenticationResponse.errors?['msg'] ?? "Something went wrong please try again later");
      }
    } catch(_) {
      return const Left("Something went wrong please try again later");
    }
  }

  @override
  Future<Either<String, AuthenticationResponse>> editPassword(String currentPassword, String password, String rePassword, String token) async{
    String baseUrl = "ecommerce.routemisr.com";
    String endPoint = "api/v1/users/changeMyPassword";

    try {
      Uri uri = Uri.https(baseUrl, endPoint);

      Response response = await put(
          uri,
          headers: {
            "token" : token
          },
          body: {
            "currentPassword": currentPassword,
            "password": password,
            "rePassword": rePassword
          }
      );

      AuthenticationResponse authenticationResponse = AuthenticationResponse.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(authenticationResponse);
      }
      else {
        return Left(authenticationResponse.message ?? "Something went wrong please try again later");
      }
    } catch(_) {
      return const Left("Something went wrong please try again later");
    }
  }
}