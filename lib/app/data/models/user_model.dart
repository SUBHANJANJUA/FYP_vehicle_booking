// lib/app/data/models/user_model.dart

class UserModel {
  final String uid;
  final String email;
  final String userType;

  UserModel({required this.uid, required this.email, required this.userType});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      userType: map['userType'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'userType': userType,
    };
  }
}
