import 'package:either_dart/either.dart';

abstract class ResetPasswordRepoDS {
  Future<Either<String, bool>> resetPassword(String email, String newPassword);
}