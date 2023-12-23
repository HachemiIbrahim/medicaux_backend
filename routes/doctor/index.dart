import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:medicaux_backend/source/doctor_source.dart';

Future<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _getDoctor(context);
    case HttpMethod.post:
      return _createDoctor(context);
    case HttpMethod.put:
      return _numberDoctor(context);
    // ignore: no_default_cases
    default:
      return Future.value(Response(statusCode: HttpStatus.methodNotAllowed));
  }
}

Future<Response> _numberDoctor(RequestContext context) async {
  final dataRepository = context.read<DoctorSource>();
  final num = await dataRepository.doctorCount();
  return Response.json(body: num);
}

Future<Response> _getDoctor(RequestContext context) async {
  final dataRepository = context.read<DoctorSource>();
  final lists = await dataRepository.fetchFields();
  return Response.json(body: lists);
}

Future<Response> _createDoctor(RequestContext context) async {
  final dataRepository = context.read<DoctorSource>();
  final body = await context.request.json() as Map<String, dynamic>;
  final name = body['name'] as String;
  final speciality = body['speciality'] as String;
  await dataRepository.addList(name, speciality);
  return Response(statusCode: HttpStatus.created);
}
