import 'package:e_commerce/domain/repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyEmailUseCase {
  VerifyEmailRepo verifyEmailRepo;

  VerifyEmailUseCase(this.verifyEmailRepo);

  Future<Either<String, bool>> execute(String email) {
    return verifyEmailRepo.verifyEmail(email);
  }
}