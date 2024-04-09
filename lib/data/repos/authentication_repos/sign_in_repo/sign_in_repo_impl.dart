import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce/data/model/authentication_response/authentication_response.dart';
import 'package:e_commerce/domain/repos/authentication_repos/sign_in_repo/sign_in_repo.dart';
import 'package:e_commerce/domain/repos/authentication_repos/sign_in_repo/sign_in_repo_ds.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignInRepo)
class SignInRepoImpl extends SignInRepo {

  SignInRepoDS signInRepoDS;

  SignInRepoImpl(this.signInRepoDS);

  @override
  Future<Either<String, AuthenticationResponse>> signIn(String email, String password) async{
    final ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi){
      return signInRepoDS.signIn(email, password);
    }
    else{
      return const Left("Please check your internet connection and try again later");
    }
  }
}