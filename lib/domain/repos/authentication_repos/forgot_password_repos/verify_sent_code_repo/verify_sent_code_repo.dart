import 'package:either_dart/either.dart';

abstract class VerifySentCodeRepo {
  Future<Either<String, bool>> verifySentCode(String code);
}