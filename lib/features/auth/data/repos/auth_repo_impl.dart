// import 'package:dartz/dartz.dart';
import 'package:dartz/dartz.dart';
import 'package:elmasa/core/errors/failure.dart';
import 'package:elmasa/core/services/firebase_auth_service.dart';
import 'package:elmasa/features/auth/data/models/user_model.dart';
import 'package:elmasa/features/auth/domain/entitis/user_entity.dart';
import 'package:elmasa/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return right(UserModel.fromUser(user).toEntity());
    } catch (e) {
      return left(Failure(errMessage: e.toString()));
    }
  }
}
