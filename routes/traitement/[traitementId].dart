import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:medicaux_backend/source/traitement_source.dart';

Future<Response> onRequest(RequestContext context, String traitementId) async {
  switch (context.request.method) {
    case HttpMethod.patch:
      return _updateTraitement(context, traitementId);
    case HttpMethod.delete:
      return _deleteTraitement(context, traitementId);
    // ignore: no_default_cases
    default:
      return Future.value(Response(statusCode: HttpStatus.methodNotAllowed));
  }
}

///update the list using it's id
Future<Response> _updateTraitement(
    RequestContext context, String traitementId) async {
  final dataRepository = context.read<TraitementSource>();
  final body = await context.request.json() as Map<String, dynamic>;
  final patientId = int.parse(body['patientId'] as String);
  final doctorId = int.parse(body['doctorId'] as String);
  final description = body['description'] as String;
  await dataRepository.updateList(
      patientId, doctorId, description, traitementId);
  return Response(statusCode: HttpStatus.accepted);
}

///delete a list with it's id
Future<Response> _deleteTraitement(
    RequestContext context, String traitementId) async {
  final dataRepository = context.read<TraitementSource>();
  await dataRepository.deleteList(traitementId);
  return Response(statusCode: HttpStatus.accepted);
}
