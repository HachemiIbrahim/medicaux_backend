import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:medicaux_backend/source/patient_source.dart';

Future<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _getPatient(context);
    case HttpMethod.post:
      return _createPatient(context);
    case HttpMethod.put:
      return _numberPatient(context);
    // ignore: no_default_cases
    default:
      return Future.value(Response(statusCode: HttpStatus.methodNotAllowed));
  }
}

Future<Response> _numberPatient(RequestContext context) async {
  final dataRepository = context.read<PatientSource>();
  final num = await dataRepository.patientCount();
  return Response.json(body: num);
}

Future<Response> _getPatient(RequestContext context) async {
  final dataRepository = context.read<PatientSource>();
  final lists = await dataRepository.fetchFields();
  return Response.json(body: lists);
}

Future<Response> _createPatient(RequestContext context) async {
  final dataRepository = context.read<PatientSource>();
  final body = await context.request.json() as Map<String, dynamic>;
  final name = body['name'] as String;
  final age = int.parse(body['age'] as String);
  final phoneNumber = body['phoneNumber'] as String;
  await dataRepository.addList(name, age, phoneNumber);
  return Response(statusCode: HttpStatus.created);
}
