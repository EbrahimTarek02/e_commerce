import 'package:either_dart/either.dart';

abstract class VerifyEmailRepo{
  Future<Either<String, bool>> verifyEmail(String email);
}