import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:medicaux_backend/source/patient_source.dart';

Future<Response> onRequest(RequestContext context, String patientId) async {
  switch (context.request.method) {
    case HttpMethod.patch:
      return _updatePatient(context, patientId);
    case HttpMethod.delete:
      return _deletePatient(context, patientId);
    // ignore: no_default_cases
    default:
      return Future.value(Response(statusCode: HttpStatus.methodNotAllowed));
  }
}

///update the list using it's id
Future<Response> _updatePatient(
    RequestContext context, String patientId) async {
  final dataRepository = context.read<PatientSource>();
  final body = await context.request.json() as Map<String, dynamic>;
  final name = body['name'] as String;
  final age = int.parse(body['age'] as String);
  final phoneNumber = body['phoneNumber'] as String;
  await dataRepository.updateList(name, age, phoneNumber, patientId);
  return Response(statusCode: HttpStatus.accepted);
}

///delete a list with it's id
Future<Response> _deletePatient(
    RequestContext context, String patientId) async {
  final dataRepository = context.read<PatientSource>();
  await dataRepository.deleteList(patientId);
  return Response(statusCode: HttpStatus.accepted);
}
