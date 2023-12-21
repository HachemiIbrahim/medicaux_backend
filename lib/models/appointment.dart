// ignore: public_member_api_docs
class AppointmentModel {
  // ignore: public_member_api_docs
  const AppointmentModel({
    required this.appointmentId,
    required this.patientName,
    required this.doctorName,
    required this.appointment_date,
  });

  // ignore: public_member_api_docs
  factory AppointmentModel.fromRowAssoc(Map<String, String?> json) {
    return AppointmentModel(
        appointmentId: int.parse(json['appointmentId']!),
        patientName: json['patientName']!,
        doctorName: json['doctorName']!,
        appointment_date: json['appointment_date']!);
  }

  // ignore: public_member_api_docs
  Map<String, dynamic> toJson() {
    return {
      'appointmentId': appointmentId.toString(),
      'patientName': patientName,
      'doctorName': doctorName,
      'appointment_date': appointment_date
    };
  }

  final int appointmentId;
  final String patientName;
  final String doctorName;
  final String appointment_date;
}
