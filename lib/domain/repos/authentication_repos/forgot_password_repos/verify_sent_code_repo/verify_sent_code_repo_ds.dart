import 'package:either_dart/either.dart';

abstract class VerifySentCodeRepoDS {
  Future<Either<String, bool>> verifySentCode(String code);
}