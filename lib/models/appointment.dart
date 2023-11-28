// ignore: public_member_api_docs
class AppointmentModel {
  // ignore: public_member_api_docs
  const AppointmentModel({
    required this.appointmentId,
    required this.patientId,
    required this.doctorId,
    required this.appointment_date,
  });

  // ignore: public_member_api_docs
  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      appointmentId: json['appointmentId'] as int,
      patientId: json['patientId'] as int,
      doctorId: json['doctorId'] as int,
      appointment_date: json['appointment_date'] as String,
    );
  }

  // ignore: public_member_api_docs
  factory AppointmentModel.fromRowAssoc(Map<String, String?> json) {
    return AppointmentModel(
        appointmentId: int.parse(json['appointmentId']!),
        patientId: int.parse(json['patientId']!),
        doctorId: int.parse(json['doctorId']!),
        appointment_date: json['appointment_date']!);
  }

  // ignore: public_member_api_docs
  Map<String, dynamic> toJson() {
    return {
      'appointmentId': appointmentId.toString(),
      'patientId': patientId.toString(),
      'doctorId': doctorId.toString(),
      'appointment_date': appointment_date
    };
  }

  final int appointmentId;
  final int patientId;
  final int doctorId;
  final String appointment_date;
}
