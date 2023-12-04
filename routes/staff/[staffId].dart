import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:medicaux_backend/source/staff_source.dart';

Future<Response> onRequest(RequestContext context, String staffId) async {
  switch (context.request.method) {
    case HttpMethod.patch:
      return _updateStaff(context, staffId);
    case HttpMethod.delete:
      return _deleteStaff(context, staffId);
    // ignore: no_default_cases
    default:
      return Future.value(Response(statusCode: HttpStatus.methodNotAllowed));
  }
}

///update the list using it's id
Future<Response> _updateStaff(RequestContext context, String staffId) async {
  final dataRepository = context.read<StaffSource>();
  final body = await context.request.json() as Map<String, dynamic>;
  final name = body['name'] as String;
  final role = body['role'] as String;
  await dataRepository.updateList(name, role, staffId);
  return Response(statusCode: HttpStatus.accepted);
}

///delete a list with it's id
Future<Response> _deleteStaff(RequestContext context, String staffId) async {
  final dataRepository = context.read<StaffSource>();
  await dataRepository.deleteList(staffId);
  return Response(statusCode: HttpStatus.accepted);
}
