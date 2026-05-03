import 'package:elmasa/features/auth/domain/entitis/user_entity.dart';

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

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'uid': uid};
  }
}
