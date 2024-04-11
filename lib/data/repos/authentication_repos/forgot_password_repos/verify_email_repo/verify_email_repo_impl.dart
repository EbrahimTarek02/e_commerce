import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce/domain/repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo.dart';
import 'package:e_commerce/domain/repos/authentication_repos/forgot_password_repos/verify_email_repo/verify_email_repo_ds.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: VerifyEmailRepo)
class VerifyEmailRepoImpl extends VerifyEmailRepo{

  VerifyEmailRepoDS verifyEmailRepoDS;

  VerifyEmailRepoImpl(this.verifyEmailRepoDS);

  @override
  Future<Either<String, bool>> verifyEmail(String email) async{
    final ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      return verifyEmailRepoDS.verifyEmail(email);
    }
    else {
      return const Left("Please check your internet connection and try again later");
    }
  }

}