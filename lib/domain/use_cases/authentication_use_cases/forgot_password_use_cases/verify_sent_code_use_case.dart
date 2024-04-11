import 'package:e_commerce/domain/repos/authentication_repos/forgot_password_repos/verify_sent_code_repo/verify_sent_code_repo.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifySentCodeUseCase {
  VerifySentCodeRepo verifySentCodeRepo;

  VerifySentCodeUseCase(this.verifySentCodeRepo);

  Future<Either<String, bool>> execute(String code) async{
    return verifySentCodeRepo.verifySentCode(code);
  }
}