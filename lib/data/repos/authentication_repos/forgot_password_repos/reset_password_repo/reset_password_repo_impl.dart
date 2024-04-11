import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce/domain/repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo.dart';
import 'package:e_commerce/domain/repos/authentication_repos/forgot_password_repos/reset_password_repo/reset_password_repo_ds.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ResetPasswordRepo)
class RestPasswordRepoImpl extends ResetPasswordRepo {
  ResetPasswordRepoDS resetPasswordRepoDS;

  RestPasswordRepoImpl(this.resetPasswordRepoDS);

  @override
  Future<Either<String, bool>> resetPassword(String email, String newPassword) async{
    final ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      return resetPasswordRepoDS.resetPassword(email, newPassword);
    }
    else {
      return const Left("Please check your internet connection and try again later");
    }
  }

}