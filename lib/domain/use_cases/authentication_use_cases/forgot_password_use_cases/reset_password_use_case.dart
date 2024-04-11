import 'package:e_commerce/domain/repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordUseCase {
  ResetPasswordRepo resetPasswordRepo;

  ResetPasswordUseCase(this.resetPasswordRepo);

  Future<Either<String, bool>> execute(String email, String newPassword) {
    return resetPasswordRepo.resetPassword(email, newPassword);
  }
}