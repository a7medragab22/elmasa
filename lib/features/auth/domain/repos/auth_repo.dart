import 'package:dartz/dartz.dart';
import 'package:elmasa/core/errors/failure.dart';
import 'package:elmasa/features/auth/domain/entitis/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });
}
