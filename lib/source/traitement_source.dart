// ignore_for_file: lines_longer_than_80_chars

import 'package:medicaux_backend/database/sql_client.dart';
import 'package:medicaux_backend/models/traitement.dart';

/// data source form MySQL

class TraitementSource {
  /// initializing
  const TraitementSource(
    this.sqlClient,
  );

  ///Fetches all table fields from list table in our database
  Future<List<TraitementModel>> fetchFields() async {
    // sqlQuey
    const sqlQuery =
        'SELECT traitementId,patientId,doctorId,description FROM traitement;';
    final result = await sqlClient.execute(sqlQuery);
    final lists = <TraitementModel>[];
    for (final row in result.rows) {
      lists.add(TraitementModel.fromRowAssoc(row.assoc()));
    }
    return lists;
  }

  ///add a list to the database
  Future<void> addList(
      String patientId, String doctorId, String description) async {
    final sqlQuery =
        'INSERT INTO traitement (patientId,doctorId,description) VALUES ("$patientId","$doctorId","$description");';
    await sqlClient.execute(sqlQuery);
  }

  ///update the list
  Future<void> updateList(String patientId, String doctorId, String description,
      String traitementId) async {
    final sqlQuery =
        'UPDATE traitement SET patientId = "$patientId" , doctorId = "$doctorId",description = "$description" where traitementId = $traitementId;';
    await sqlClient.execute(sqlQuery);
  }

  ///delete a list
  Future<void> deleteList(String traitementId) async {
    final sqlQuery =
        'DELETE FROM traitement WHERE traitementId = $traitementId;';
    await sqlClient.execute(sqlQuery);
  }

  /// accessing you client
  final MySQLClient sqlClient;
}
