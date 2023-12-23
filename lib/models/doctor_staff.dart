// ignore: public_member_api_docs
class DoctorStaffModel {
  // ignore: public_member_api_docs
  const DoctorStaffModel({
    required this.doctorID,
    required this.staffID,
    required this.assignmentDate,
    required this.doctorName,
    required this.staffName,
  });

  // ignore: public_member_api_docs
  factory DoctorStaffModel.fromJson(Map<String, dynamic> json) {
    return DoctorStaffModel(
      doctorID: json['doctorID'] as int,
      staffID: json['staffID'] as int,
      assignmentDate: json['assignmentDate'] as String,
      doctorName: json['doctorName'] as String,
      staffName: json['staffName'] as String,
    );
  }

  // ignore: public_member_api_docs
  factory DoctorStaffModel.fromRowAssoc(Map<String, String?> json) {
    return DoctorStaffModel(
        doctorID: int.parse(json['doctorID']!),
        staffID: int.parse(json['staffID']!),
        assignmentDate: json['assignmentDate']!,
        doctorName: json['doctorName']!,
        staffName: json['staffName']!);
  }

  // ignore: public_member_api_docs
  Map<String, dynamic> toJson() {
    return {
      'doctorID': doctorID,
      'staffID': staffID,
      'assignmentDate': assignmentDate,
      'doctorName': doctorName,
      'staffName': staffName,
    };
  }

  final int doctorID;
  final int staffID;
  final String assignmentDate;
  final String doctorName;
  final String staffName;
}
