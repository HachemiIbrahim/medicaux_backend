import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:medicaux_backend/source/appointment_source.dart';

Future<Response> onRequest(RequestContext context, String appointmentId) async {
  switch (context.request.method) {
    case HttpMethod.patch:
      return _updateAppointment(context, appointmentId);
    case HttpMethod.delete:
      return _deleteAppointment(context, appointmentId);
    // ignore: no_default_cases
    default:
      return Future.value(Response(statusCode: HttpStatus.methodNotAllowed));
  }
}

///update the list using it's id
Future<Response> _updateAppointment(
    RequestContext context, String appointmentId) async {
  final dataRepository = context.read<AppointementSource>();
  final body = await context.request.json() as Map<String, dynamic>;
  final patientId = int.parse(body['patientId'] as String);
  final doctorId = int.parse(body['doctorId'] as String);
  final appointmentDate = body['appointmentDate'] as String;
  await dataRepository.updateList(
      patientId, doctorId, appointmentDate, appointmentId);
  return Response(statusCode: HttpStatus.accepted);
}

///delete a list with it's id
Future<Response> _deleteAppointment(
    RequestContext context, String appointmentId) async {
  final dataRepository = context.read<AppointementSource>();
  await dataRepository.deleteList(appointmentId);
  return Response(statusCode: HttpStatus.accepted);
}
