// ignore: public_member_api_docs
class DoctorStaffModel {
  // ignore: public_member_api_docs
  const DoctorStaffModel({
    required this.staffID,
    required this.doctorID,
    required this.assignmentDate,
  });

  // ignore: public_member_api_docs
  factory DoctorStaffModel.fromJson(Map<String, dynamic> json) {
    return DoctorStaffModel(
      staffID: json['staffID'] as int,
      doctorID: json['doctorID'] as int,
      assignmentDate: json['assignmentDate'] as String,
    );
  }

  // ignore: public_member_api_docs
  factory DoctorStaffModel.fromRowAssoc(Map<String, String?> json) {
    return DoctorStaffModel(
        staffID: int.parse(json['staffID']!),
        doctorID: int.parse(json['doctorID']!),
        assignmentDate: json['assignmentDate']!);
  }

  // ignore: public_member_api_docs
  Map<String, dynamic> toJson() {
    return {
      'staffID': staffID.toString(),
      'doctorID': doctorID.toString(),
      'assignmentDate': assignmentDate
    };
  }

  final int staffID;
  final int doctorID;
  final String assignmentDate;
}
