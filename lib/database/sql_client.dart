import 'package:mysql_client/mysql_client.dart';

// ignore: public_member_api_docs
class MySQLClient {
  // ignore: public_member_api_docs
  factory MySQLClient() {
    return inst;
  }

  MySQLClient._internal() {
    _connect();
  }

  static final MySQLClient inst = MySQLClient._internal();

  MySQLConnection? _connection;

  // ignore: public_member_api_docs
  Future<void> _connect() async {
    _connection = await MySQLConnection.createConnection(
      host: 'localhost',
      port: 3306,
      userName: 'root',
      password: 'ibra2004',
      databaseName: 'mytasklist',
      secure: true,
    );
    await _connection?.connect();
  }

  // ignore: public_member_api_docs
  Future<IResultSet> execute(
    String query, {
    Map<String, dynamic>? params,
    bool iterable = false,
  }) async {
    if (_connection == null || _connection?.connected == false) {
      await _connect();
    }

    if (_connection?.connected == false) {
      throw Exception('Could not connect to the database');
    }
    return _connection!.execute(query, params, iterable);
  }
}
