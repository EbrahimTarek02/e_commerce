import 'package:e_commerce/data/model/authentication_response/authentication_response.dart';
import 'package:e_commerce/domain/repos/authentication_repos/sign_in_repo/sign_in_repo.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInUseCase {
  SignInRepo signInRepo;

  SignInUseCase(this.signInRepo);

  Future<Either<String, AuthenticationResponse>> execute(String email, String password) async{
    return await signInRepo.signIn(email, password);
  }
}