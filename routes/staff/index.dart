import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:medicaux_backend/source/staff_source.dart';

Future<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _getStaff(context);
    case HttpMethod.post:
      return _createStaff(context);
    // ignore: no_default_cases
    default:
      return Future.value(Response(statusCode: HttpStatus.methodNotAllowed));
  }
}

Future<Response> _getStaff(RequestContext context) async {
  final dataRepository = context.read<StaffSource>();
  final lists = await dataRepository.fetchFields();
  return Response.json(body: lists);
}

Future<Response> _createStaff(RequestContext context) async {
  final dataRepository = context.read<StaffSource>();
  final body = await context.request.json() as Map<String, dynamic>;
  final name = body['name'] as String;
  final role = body['role'] as String;
  await dataRepository.addList(name, role);
  return Response(statusCode: HttpStatus.created);
}
