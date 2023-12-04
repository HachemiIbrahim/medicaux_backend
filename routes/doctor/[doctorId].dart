import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:medicaux_backend/source/doctor_source.dart';

Future<Response> onRequest(RequestContext context, String doctorId) async {
  switch (context.request.method) {
    case HttpMethod.patch:
      return _updateList(context, doctorId);
    case HttpMethod.delete:
      return _deleteList(context, doctorId);
    // ignore: no_default_cases
    default:
      return Future.value(Response(statusCode: HttpStatus.methodNotAllowed));
  }
}

///update the list using it's id
Future<Response> _updateList(RequestContext context, String doctorId) async {
  final dataRepository = context.read<DoctorSource>();
  final body = await context.request.json() as Map<String, dynamic>;
  final name = body['name'] as String;
  final speciality = body['speciality'] as String;
  await dataRepository.updateList(name, speciality, doctorId);
  return Response(statusCode: HttpStatus.accepted);
}

///delete a list with it's id
Future<Response> _deleteList(RequestContext context, String doctorId) async {
  final dataRepository = context.read<DoctorSource>();
  await dataRepository.deleteList(doctorId);
  return Response(statusCode: HttpStatus.accepted);
}
