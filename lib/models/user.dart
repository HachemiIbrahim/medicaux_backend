// ignore: public_member_api_docs
class UserModel {
  // ignore: public_member_api_docs
  const UserModel({
    required this.username,
    required this.password,
  });

  // ignore: public_member_api_docs
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'] as String,
      password: json['password'] as String,
    );
  }

  // ignore: public_member_api_docs
  factory UserModel.fromRowAssoc(Map<String, String?> json) {
    return UserModel(
      username: json['username']!,
      password: json['password']!,
    );
  }

  // ignore: public_member_api_docs
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }

  final String username;
  final String password;
}
