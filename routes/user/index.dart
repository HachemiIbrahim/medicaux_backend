import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:medicaux_backend/source/user_source.dart';

Future<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.post:
      return _checkUser(context);
    // ignore: no_default_cases
    default:
      return Future.value(Response(statusCode: HttpStatus.methodNotAllowed));
  }
}

Future<Response> _checkUser(RequestContext context) async {
  try {
    final dataRepository = context.read<UserSource>();
    final body = await context.request.json() as Map<String, dynamic>;
    final username = body['username'] as String;
    final password = body['password'] as String;
    final exists = await dataRepository.checkUser(username, password);
    print(exists);
    if (exists) {
      return Response(statusCode: HttpStatus.accepted);
    } else {
      return Response(statusCode: HttpStatus.unauthorized);
    }
  } catch (e) {
    return Response(statusCode: HttpStatus.internalServerError);
  }
}
