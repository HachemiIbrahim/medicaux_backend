// ignore: public_member_api_docs
class StaffModel {
  // ignore: public_member_api_docs
  const StaffModel({
    required this.staffId,
    required this.name,
    required this.role,
  });

  // ignore: public_member_api_docs
  factory StaffModel.fromJson(Map<String, dynamic> json) {
    return StaffModel(
      staffId: json['staffId'] as int,
      name: json['name'] as String,
      role: json['role'] as String,
    );
  }

  // ignore: public_member_api_docs
  factory StaffModel.fromRowAssoc(Map<String, String?> json) {
    return StaffModel(
      staffId: int.parse(json['staffId']!),
      name: json['name']!,
      role: json['role']!,
    );
  }

  // ignore: public_member_api_docs
  Map<String, dynamic> toJson() {
    return {'staffId': staffId.toString(), 'name': name, 'role': role};
  }

  final int staffId;
  final String name;
  final String role;
}
