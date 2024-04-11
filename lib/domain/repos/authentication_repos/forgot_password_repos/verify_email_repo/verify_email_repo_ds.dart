import 'package:either_dart/either.dart';

abstract class VerifyEmailRepoDS {
  Future<Either<String, bool>> verifyEmail (String email);
}