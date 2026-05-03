// import 'package:dartz/dartz.dart';
// import 'package:elmasa/core/errors/failure.dart';
// import 'package:elmasa/core/services/firebase_auth_service.dart';
// import 'package:elmasa/features/auth/domain/entitis/user_entity.dart';
// import 'package:elmasa/features/auth/domain/repos/auth_repo.dart';

// class AuthRepoImpl extends AuthRepo {
//   final FirebaseAuthService firebaseAuthService;

//   AuthRepoImpl({required this.firebaseAuthService});
//   @override
//   Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
//     required UserEntity userEntity,
//   }) async {
//     firebaseAuthService.createUserWithEmailAndPassword(
//       email: userEntity.email,
//       password: userEntity
//     );
//   }
// }
