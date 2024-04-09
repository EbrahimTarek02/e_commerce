import 'package:e_commerce/data/model/authentication_response/authentication_response.dart';
import 'package:either_dart/either.dart';

abstract class SignUpRepoDS {
  Future<Either<String, AuthenticationResponse>> signUp(String name, String phoneNumber, String email, String password, String rePassword);
}