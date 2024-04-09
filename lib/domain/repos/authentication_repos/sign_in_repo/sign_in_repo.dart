import 'package:e_commerce/data/model/authentication_response/authentication_response.dart';
import 'package:either_dart/either.dart';

abstract class SignInRepo {
  Future<Either<String, AuthenticationResponse>> signIn(String email, String password);
}