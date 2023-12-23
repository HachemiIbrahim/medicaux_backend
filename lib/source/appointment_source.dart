// ignore_for_file: lines_longer_than_80_chars

import 'package:intl/intl.dart';
import 'package:medicaux_backend/database/sql_client.dart';
import 'package:medicaux_backend/models/appointment.dart';

/// data source form MySQL

class AppointementSource {
  /// initializing
  const AppointementSource(
    this.sqlClient,
  );

  Future<List<AppointmentModel>> fetchTodayAppointments() async {
    const sqlQuery =
        'SELECT appointmentId, patient.name as patientName, doctors.name as doctorName, appointment_date FROM appointment JOIN patient ON appointment.patientId = patient.patientId JOIN doctors ON appointment.doctorId = doctors.doctorId WHERE DATE(appointment_date) = CURDATE();';
    final result = await sqlClient.execute(sqlQuery);
    final lists = <AppointmentModel>[];
    for (final row in result.rows) {
      lists.add(AppointmentModel.fromRowAssoc(row.assoc()));
    }
    return lists;
  }

  ///Fetches all table fields from list table in our database
  Future<List<AppointmentModel>> fetchFields() async {
    // sqlQuey
    const sqlQuery =
        'SELECT appointmentId, patient.name as patientName, doctors.name as doctorName, appointment_date FROM appointment JOIN patient ON appointment.patientId = patient.patientId JOIN doctors ON appointment.doctorId = doctors.doctorId;';
    final result = await sqlClient.execute(sqlQuery);
    final lists = <AppointmentModel>[];
    for (final row in result.rows) {
      lists.add(AppointmentModel.fromRowAssoc(row.assoc()));
    }
    return lists;
  }

  ///add a list to the database
  Future<void> addList(
      int patientId, int doctorId, String appointmentDate) async {
    final formatedDate = DateFormat('yyyy-MM-dd HH:mm').parse(appointmentDate);
    final sqlQuery =
        'INSERT INTO appointment (patientId,doctorId,appointment_date) VALUES ($patientId,$doctorId,"$formatedDate");';
    await sqlClient.execute(sqlQuery);
  }

  ///update the list
  Future<void> updateList(int patientId, int doctorId, String appointmentDate,
      String appointmentId) async {
    final formatedDate = DateFormat('yyyy-MM-dd HH:mm').parse(appointmentDate);
    final sqlQuery =
        'UPDATE appointment SET patientId = $patientId , doctorId = $doctorId,appointment_date = "$formatedDate" where appointmentId = $appointmentId;';
    await sqlClient.execute(sqlQuery);
  }

  ///delete a list
  Future<void> deleteList(String appointmentId) async {
    final sqlQuery =
        'DELETE FROM appointment WHERE appointmentId = $appointmentId;';
    await sqlClient.execute(sqlQuery);
  }

  /// accessing you client
  final MySQLClient sqlClient;
}
