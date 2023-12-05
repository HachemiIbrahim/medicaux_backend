import 'package:dart_frog/dart_frog.dart';
import 'package:medicaux_backend/database/sql_client.dart';
import 'package:medicaux_backend/source/appointment_source.dart';

Handler middleware(Handler handler) {
  // we will call use the handler to handle our request and than
  // we will request a logger which means for each request
  // we will inject our  dependency
  return handler.use(requestLogger()).use(injectionHandler());
}

/// it will get the connection from our sqlClient and based on that
/// it will read the  context of our data source
/// because handler will handle the  each and every request we will make
Middleware injectionHandler() {
  return (handler) {
    return handler.use(
      provider<AppointementSource>(
        (context) => AppointementSource(context.read<MySQLClient>()),
      ),
    );
  };
}
