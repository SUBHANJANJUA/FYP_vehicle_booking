class UserModel {
  final String uid;
  final String name;
  final String email;
  final String userType;
  final String licenseNumber;
  final String licenseExpDate;
  final String licenseType;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.userType,
    required this.licenseNumber,
    required this.licenseExpDate,
    required this.licenseType,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json['uid'] ?? '',
        name: json['name'] ?? '',
        email: json['email'] ?? '',
        userType: json['userType'] ?? '',
        licenseNumber: json['licenseNumber'] ?? '',
        licenseExpDate: json['licenseExpDate'] ?? '',
        licenseType: json['licenseType'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'email': email,
        'userType': userType,
        'licenseNumber': licenseNumber,
        'licenseExpDate': licenseExpDate,
        'licenseType': licenseType,
      };
}
