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

  ///Fetches all table fields from list table in our database
  Future<List<AppointmentModel>> fetchFields() async {
    // sqlQuey
    const sqlQuery =
        'SELECT appointmentId,patientId,doctorId,appointment_date FROM appointment;';
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
    final formatedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').parse(appointmentDate);
    final sqlQuery =
        'INSERT INTO appointment (patientId,doctorId,appointment_date) VALUES ($patientId,$doctorId,"$formatedDate");';
    await sqlClient.execute(sqlQuery);
  }

  ///update the list
  Future<void> updateList(int patientId, int doctorId, String appointmentDate,
      String appointmentId) async {
    final formatedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').parse(appointmentDate);
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
