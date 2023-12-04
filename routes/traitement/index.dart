import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:medicaux_backend/source/traitement_source.dart';

Future<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _getTraitement(context);
    case HttpMethod.post:
      return _createTraitement(context);
    // ignore: no_default_cases
    default:
      return Future.value(Response(statusCode: HttpStatus.methodNotAllowed));
  }
}

Future<Response> _getTraitement(RequestContext context) async {
  final dataRepository = context.read<TraitementSource>();
  final lists = await dataRepository.fetchFields();
  return Response.json(body: lists);
}

Future<Response> _createTraitement(RequestContext context) async {
  final dataRepository = context.read<TraitementSource>();
  final body = await context.request.json() as Map<String, dynamic>;
  final patientId = int.parse(body['patientId'] as String);
  final doctorId = int.parse(body['doctorId'] as String);
  final description = body['description'] as String;
  await dataRepository.addList(patientId, doctorId, description);
  return Response(statusCode: HttpStatus.created);
}
