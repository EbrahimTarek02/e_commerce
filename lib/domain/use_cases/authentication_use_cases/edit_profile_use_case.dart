import 'package:e_commerce/data/model/authentication_response/authentication_response.dart';
import 'package:e_commerce/domain/repos/authentication_repos/edit_profile_repo/edit_profile_repo.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditProfileUseCase {
  EditProfileRepo editProfileRepo;

  EditProfileUseCase(this.editProfileRepo);

  Future<Either<String, AuthenticationResponse>> executeEditProfile(String name, String email, String token) async{
    return await editProfileRepo.editProfile(name, email, token);
  }

  Future<Either<String, AuthenticationResponse>> executeEditPassword(String currentPassword, String password, String rePassword, String token) async{
    return await editProfileRepo.editPassword(currentPassword, password, rePassword, token);
  }
}