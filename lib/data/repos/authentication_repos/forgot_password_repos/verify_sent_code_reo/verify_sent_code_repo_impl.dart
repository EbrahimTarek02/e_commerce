import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce/domain/repos/authentication_repos/forgot_password_repos/verify_sent_code_repo/verify_sent_code_repo.dart';
import 'package:e_commerce/domain/repos/authentication_repos/forgot_password_repos/verify_sent_code_repo/verify_sent_code_repo_ds.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: VerifySentCodeRepo)
class VerifySentCodeRepoImpl extends VerifySentCodeRepo{

  VerifySentCodeRepoDS verifySentCodeRepoDS;

  VerifySentCodeRepoImpl(this.verifySentCodeRepoDS);

  @override
  Future<Either<String, bool>> verifySentCode(String code) async{
    final ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      return verifySentCodeRepoDS.verifySentCode(code);
    }
    else {
      return const Left("Please check your internet connection and try again later");
    }
  }

}