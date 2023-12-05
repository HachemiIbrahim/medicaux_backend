// ignore_for_file: lines_longer_than_80_chars

import 'package:intl/intl.dart';
import 'package:medicaux_backend/database/sql_client.dart';
import 'package:medicaux_backend/models/doctor_staff.dart';

/// data source form MySQL

class DoctorStaffSource {
  /// initializing
  const DoctorStaffSource(
    this.sqlClient,
  );

  ///Fetches all table fields from list table in our database
  Future<List<DoctorStaffModel>> fetchFields() async {
    // sqlQuey
    const sqlQuery =
        'SELECT staffID,doctorID,assignmentDate FROM doctor_staff;';
    final result = await sqlClient.execute(sqlQuery);
    final lists = <DoctorStaffModel>[];
    for (final row in result.rows) {
      lists.add(DoctorStaffModel.fromRowAssoc(row.assoc()));
    }
    return lists;
  }

  ///add a list to the database
  Future<void> addList(
      String staffId, String doctorId, String assignmentDate) async {
    final formatedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').parse(assignmentDate);
    final sqlQuery =
        'INSERT INTO doctor_staff (staffID,doctorID,assignmentDate) VALUES ("$staffId","$doctorId","$formatedDate");';
    await sqlClient.execute(sqlQuery);
  }

  ///delete a list
  Future<void> deleteList(String staffId, String doctorId) async {
    final sqlQuery =
        'DELETE FROM doctor_staff WHERE doctorID = $doctorId AND staffID = $staffId;';
    await sqlClient.execute(sqlQuery);
  }

  /// accessing you client
  final MySQLClient sqlClient;
}
