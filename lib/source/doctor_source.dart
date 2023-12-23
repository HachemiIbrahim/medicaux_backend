// ignore_for_file: lines_longer_than_80_chars

import 'package:medicaux_backend/database/sql_client.dart';
import 'package:medicaux_backend/models/doctors.dart';

/// data source form MySQL

class DoctorSource {
  /// initializing
  const DoctorSource(
    this.sqlClient,
  );
  Future<int> doctorCount() async {
    const sqlQuery = 'SELECT COUNT(*) AS total FROM doctors;';
    final resultSet = await sqlClient.execute(sqlQuery);
    final row = resultSet.rows.single;
    final count = row.typedColAt<int>(0);
    return count!;
  }

  ///Fetches all table fields from list table in our database
  Future<List<DoctorModel>> fetchFields() async {
    // sqlQuey
    const sqlQuery = 'SELECT doctorId,name,speciality FROM doctors;';
    final result = await sqlClient.execute(sqlQuery);
    final lists = <DoctorModel>[];
    for (final row in result.rows) {
      lists.add(DoctorModel.fromRowAssoc(row.assoc()));
    }
    return lists;
  }

  ///add a list to the database
  Future<void> addList(String name, String speciality) async {
    final sqlQuery =
        'INSERT INTO doctors (name,speciality) VALUES ("$name","$speciality");';
    await sqlClient.execute(sqlQuery);
  }

  ///update the list
  Future<void> updateList(
      String name, String speciality, String doctorId) async {
    final sqlQuery =
        'UPDATE doctors SET name = "$name" , speciality = "$speciality" where doctorId = $doctorId;';
    await sqlClient.execute(sqlQuery);
  }

  ///delete a list
  Future<void> deleteList(String doctorId) async {
    await sqlClient
        .execute('DELETE FROM doctor_staff WHERE doctorId = $doctorId;');
    await sqlClient
        .execute('DELETE FROM appointment WHERE doctorId = $doctorId;');
    await sqlClient
        .execute('DELETE FROM traitement WHERE doctorId = $doctorId;');
    final sqlQuery = 'DELETE FROM doctors WHERE doctorId = $doctorId;';
    await sqlClient.execute(sqlQuery);
  }

  /// accessing you client
  final MySQLClient sqlClient;
}
