import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce/data/model/authentication_response/authentication_response.dart';
import 'package:e_commerce/domain/repos/authentication_repos/edit_profile_repo/edit_profile_repo.dart';
import 'package:e_commerce/domain/repos/authentication_repos/edit_profile_repo/edit_profile_repo_ds.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: EditProfileRepo)
class EditProfileRepoImpl extends EditProfileRepo {

  EditProfileRepoDS editProfileRepoDS;

  EditProfileRepoImpl(this.editProfileRepoDS);

  @override
  Future<Either<String, AuthenticationResponse>> editProfile(String name, String email, String token) async{
    final ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi){
      return editProfileRepoDS.editProfile(name, email, token);
    }
    else{
      return const Left("Please check your internet connection and try again later");
    }
  }

  @override
  Future<Either<String, AuthenticationResponse>> editPassword(String currentPassword, String password, String rePassword, String token) async{
    final ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi){
      return editProfileRepoDS.editPassword(currentPassword, password, rePassword, token);
    }
    else{
      return const Left("Please check your internet connection and try again later");
    }
  }

}