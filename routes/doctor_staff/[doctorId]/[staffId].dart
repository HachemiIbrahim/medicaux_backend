import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:medicaux_backend/source/doctor_staff_source.dart';

Future<Response> onRequest(
    RequestContext context, String doctorId, String staffId) async {
  switch (context.request.method) {
    case HttpMethod.delete:
      return _deleteDoctorStaff(context, doctorId, staffId);
    // ignore: no_default_cases
    default:
      return Future.value(Response(statusCode: HttpStatus.methodNotAllowed));
  }
}

///delete a list with it's id
Future<Response> _deleteDoctorStaff(
    RequestContext context, String staffId, String doctorId) async {
  final dataRepository = context.read<DoctorStaffSource>();
  await dataRepository.deleteList(doctorId, staffId);
  return Response(statusCode: HttpStatus.accepted);
}
