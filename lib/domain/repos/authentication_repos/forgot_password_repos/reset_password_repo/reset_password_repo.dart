import 'package:either_dart/either.dart';

abstract class ResetPasswordRepo {
  Future<Either<String, bool>> resetPassword(String email, String newPassword);
}