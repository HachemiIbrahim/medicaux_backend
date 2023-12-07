// ignore_for_file: lines_longer_than_80_chars

import 'package:medicaux_backend/database/sql_client.dart';

/// data source form MySQL

class UserSource {
  /// initializing
  const UserSource(
    this.sqlClient,
  );

  ///update the list
  Future<bool> checkUser(String username, String password) async {
    final sqlQuery =
        'SELECT EXISTS( SELECT * FROM users WHERE username = "$username" AND password = "$password" )';
    final result = await sqlClient.execute(sqlQuery);
    return result.isNotEmpty;
  }

  /// accessing you client
  final MySQLClient sqlClient;
}
