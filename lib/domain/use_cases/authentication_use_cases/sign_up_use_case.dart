import 'package:e_commerce/data/model/authentication_response/authentication_response.dart';
import 'package:e_commerce/domain/repos/authentication_repos/sign_up_repo/sign_up_repo.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpUseCase {
  SignUpRepo signUpRepo;

  SignUpUseCase(this.signUpRepo);

  Future<Either<String, AuthenticationResponse>> execute(String name, String phoneNumber, String email, String password, String rePassword) async{
    return await signUpRepo.signUp(name, phoneNumber, email, password, rePassword);
  }
}