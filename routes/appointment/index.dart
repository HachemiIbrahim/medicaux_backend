import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:medicaux_backend/source/appointment_source.dart';

Future<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _getAppointment(context);
    case HttpMethod.post:
      return _createAppointment(context);
    case HttpMethod.put:
      return _getTodayAppointment(context);
    // ignore: no_default_cases
    default:
      return Future.value(Response(statusCode: HttpStatus.methodNotAllowed));
  }
}

Future<Response> _getAppointment(RequestContext context) async {
  final dataRepository = context.read<AppointementSource>();
  final lists = await dataRepository.fetchFields();
  return Response.json(body: lists);
}

Future<Response> _getTodayAppointment(RequestContext context) async {
  final dataRepository = context.read<AppointementSource>();
  final lists = await dataRepository.fetchTodayAppointments();
  return Response.json(body: lists);
}

Future<Response> _createAppointment(RequestContext context) async {
  final dataRepository = context.read<AppointementSource>();
  final body = await context.request.json() as Map<String, dynamic>;
  final patientId = int.parse(body['patientId'] as String);
  final doctorId = int.parse(body['doctorId'] as String);
  final appointmentDate = body['appointmentDate'] as String;
  await dataRepository.addList(patientId, doctorId, appointmentDate);
  return Response(statusCode: HttpStatus.created);
}
