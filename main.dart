import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:medicaux_backend/database/sql_client.dart';

/// initializing our SQL Client
final mysqlClient = MySQLClient();

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) {
  return serve(handler.use(databaseHandler()), ip, port);
}

// handling the request for our database by reading it's context
Middleware databaseHandler() {
  return (handler) {
    return handler.use(
      provider<MySQLClient>(
        (context) => mysqlClient,
      ),
    );
  };
}
