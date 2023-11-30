// ignore: public_member_api_docs
class DoctorStaffModel {
  // ignore: public_member_api_docs
  const DoctorStaffModel({
    required this.patientId,
    required this.doctorId,
    required this.assignmentDate,
  });

  // ignore: public_member_api_docs
  factory DoctorStaffModel.fromJson(Map<String, dynamic> json) {
    return DoctorStaffModel(
      patientId: json['patientId'] as int,
      doctorId: json['doctorId'] as int,
      assignmentDate: json['assignmentDate'] as String,
    );
  }

  // ignore: public_member_api_docs
  factory DoctorStaffModel.fromRowAssoc(Map<String, String?> json) {
    return DoctorStaffModel(
        patientId: int.parse(json['patientId']!),
        doctorId: int.parse(json['doctorId']!),
        assignmentDate: json['assignmentDate']!);
  }

  // ignore: public_member_api_docs
  Map<String, dynamic> toJson() {
    return {
      'patientId': patientId.toString(),
      'doctorId': doctorId.toString(),
      'assignmentDate': assignmentDate
    };
  }

  final int patientId;
  final int doctorId;
  final String assignmentDate;
}
