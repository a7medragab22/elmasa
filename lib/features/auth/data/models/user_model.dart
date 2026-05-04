import 'package:elmasa/features/auth/domain/entitis/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String name;
  final String email;
  final String uid;

  UserModel({required this.name, required this.email, required this.uid});

  factory UserModel.fromEntity(UserEntity userEnity) {
    return UserModel(
      name: userEnity.name,
      email: userEnity.email,
      uid: userEnity.uid,
    );
  }
  factory UserModel.fromUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      uid: user.uid,
    );
  }

  UserEntity toEntity() {
    return UserEntity(name: name, email: email, uid: uid);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'uid': uid};
  }
}
