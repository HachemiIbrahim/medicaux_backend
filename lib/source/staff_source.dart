// ignore_for_file: lines_longer_than_80_chars

import 'package:medicaux_backend/database/sql_client.dart';
import 'package:medicaux_backend/models/staff.dart';

/// data source form MySQL

class StaffSource {
  /// initializing
  const StaffSource(
    this.sqlClient,
  );

  ///Fetches all table fields from list table in our database
  Future<List<StaffModel>> fetchFields() async {
    // sqlQuey
    const sqlQuery = 'SELECT staffId,name,role FROM staff;';
    final result = await sqlClient.execute(sqlQuery);
    final lists = <StaffModel>[];
    for (final row in result.rows) {
      lists.add(StaffModel.fromRowAssoc(row.assoc()));
    }
    return lists;
  }

  ///add a list to the database
  Future<void> addList(String name, String role) async {
    final sqlQuery = 'INSERT INTO staff (name,role) VALUES ("$name","$role");';
    await sqlClient.execute(sqlQuery);
  }

  ///update the list
  Future<void> updateList(String name, String role, String staffId) async {
    final sqlQuery =
        'UPDATE staff SET name = "$name" , role = "$role" where staffId = $staffId;';
    await sqlClient.execute(sqlQuery);
  }

  ///delete a list
  Future<void> deleteList(String staffId) async {
    final sqlQuery = 'DELETE FROM staff WHERE staffId = $staffId;';
    await sqlClient.execute(sqlQuery);
  }

  /// accessing you client
  final MySQLClient sqlClient;
}
