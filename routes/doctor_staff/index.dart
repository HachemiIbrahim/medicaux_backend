import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:medicaux_backend/source/doctor_staff_source.dart';

Future<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _getAppointment(context);
    case HttpMethod.post:
      return _createAppointment(context);
    // ignore: no_default_cases
    default:
      return Future.value(Response(statusCode: HttpStatus.methodNotAllowed));
  }
}

Future<Response> _getAppointment(RequestContext context) async {
  final dataRepository = context.read<DoctorStaffSource>();
  final lists = await dataRepository.fetchFields();
  return Response.json(body: lists);
}

Future<Response> _createAppointment(RequestContext context) async {
  final dataRepository = context.read<DoctorStaffSource>();
  final body = await context.request.json() as Map<String, dynamic>;
  final staffId = body['staffId'] as String;
  final doctorId = body['doctorId'] as String;
  final assignmentDate = body['assignmentDate'] as String;
  await dataRepository.addList(staffId, doctorId, assignmentDate);
  return Response(statusCode: HttpStatus.created);
}
