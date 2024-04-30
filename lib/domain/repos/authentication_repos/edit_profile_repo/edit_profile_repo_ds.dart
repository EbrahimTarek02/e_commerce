import 'package:e_commerce/data/model/authentication_response/authentication_response.dart';
import 'package:either_dart/either.dart';

abstract class EditProfileRepoDS {
  Future<Either<String, AuthenticationResponse>> editProfile(String name, String email, String token);

  Future<Either<String, AuthenticationResponse>> editPassword(String currentPassword, String password, String rePassword, String token);
}