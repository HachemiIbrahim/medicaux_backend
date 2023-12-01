// ignore_for_file: lines_longer_than_80_chars

import 'package:medicaux_backend/database/sql_client.dart';
import 'package:medicaux_backend/models/patient.dart';

/// data source form MySQL

class PatientSource {
  /// initializing
  const PatientSource(
    this.sqlClient,
  );

  ///Fetches all table fields from list table in our database
  Future<List<PatientModel>> fetchFields() async {
    // sqlQuey
    const sqlQuery = 'SELECT patientId,name,age,phone_number FROM patient;';
    final result = await sqlClient.execute(sqlQuery);
    final lists = <PatientModel>[];
    for (final row in result.rows) {
      lists.add(PatientModel.fromRowAssoc(row.assoc()));
    }
    return lists;
  }

  ///add a list to the database
  Future<void> addList(String name, int age, String phoneNumber) async {
    final sqlQuery =
        'INSERT INTO patient (name,age,phone_number) VALUES ("$name",$age,"$phoneNumber");';
    await sqlClient.execute(sqlQuery);
  }

  ///update the list
  Future<void> updateList(
      String name, int age, String phoneNumber, String patientId) async {
    final sqlQuery =
        'UPDATE patient SET name = "$name" , age = $age , phone_number = "$phoneNumber" where patientId = $patientId;';
    await sqlClient.execute(sqlQuery);
  }

  ///delete a list
  Future<void> deleteList(String patientId) async {
    final sqlQuery = 'DELETE FROM patient WHERE patientId = $patientId;';
    await sqlClient.execute(sqlQuery);
  }

  /// accessing you client
  final MySQLClient sqlClient;
}
