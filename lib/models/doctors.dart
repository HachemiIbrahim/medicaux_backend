// ignore: public_member_api_docs
class DoctorModel {
  // ignore: public_member_api_docs
  const DoctorModel({
    required this.doctorId,
    required this.name,
    required this.speciality,
  });

  // ignore: public_member_api_docs
  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      doctorId: json['doctorId'] as int,
      name: json['name'] as String,
      speciality: json['speciality'] as String,
    );
  }

  // ignore: public_member_api_docs
  factory DoctorModel.fromRowAssoc(Map<String, String?> json) {
    return DoctorModel(
      doctorId: int.parse(json['doctorId']!),
      name: json['name']!,
      speciality: json['speciality']!,
    );
  }

  // ignore: public_member_api_docs
  Map<String, dynamic> toJson() {
    return {
      'doctorId': doctorId.toString(),
      'name': name,
      'speciality': speciality
    };
  }

  final int doctorId;
  final String name;
  final String speciality;
}
