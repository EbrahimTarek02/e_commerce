import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce/data/model/authentication_response/authentication_response.dart';
import 'package:e_commerce/domain/repos/authentication_repos/sign_up_repo/sign_up_repo.dart';
import 'package:e_commerce/domain/repos/authentication_repos/sign_up_repo/sign_up_repo_ds.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignUpRepo)
class SignUpRepoImpl extends SignUpRepo {

  SignUpRepoDS signUpRepoDS;

  SignUpRepoImpl(this.signUpRepoDS);

  @override
  Future<Either<String, AuthenticationResponse>> signUp(
      String name, String phoneNumber, String email, String password, String rePassword
      ) async{
    final ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == (ConnectivityResult.mobile) || connectivityResult == (ConnectivityResult.wifi)) {
      return await signUpRepoDS.signUp(name, phoneNumber, email, password, rePassword);
    }
    else {
      return const Left("Please check your internet connection and try again later");
    }
  }
}