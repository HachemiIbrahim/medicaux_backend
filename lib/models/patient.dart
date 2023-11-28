// ignore: public_member_api_docs
class PatientModel {
  // ignore: public_member_api_docs
  const PatientModel({
    required this.patientId,
    required this.name,
    required this.age,
    required this.phone_number,
  });

  // ignore: public_member_api_docs
  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      patientId: json['patientId'] as int,
      name: json['name'] as String,
      age: json['age'] as int,
      phone_number: json['phone_number'] as String,
    );
  }

  // ignore: public_member_api_docs
  factory PatientModel.fromRowAssoc(Map<String, String?> json) {
    return PatientModel(
      patientId: int.parse(json['patientId']!),
      name: json['name']!,
      age: int.parse(json['age']!),
      phone_number: json['phone_number']!,
    );
  }

  // ignore: public_member_api_docs
  Map<String, dynamic> toJson() {
    return {
      'patientId': patientId.toString(),
      'name': name,
      'age': age.toString(),
      'phone_number': phone_number
    };
  }

  final int patientId;
  final String name;
  final int age;
  final String phone_number;
}
