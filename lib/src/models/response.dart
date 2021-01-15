import 'package:bienes_servicios/src/models/errors.dart';
import 'package:flutter/material.dart';

class Response {
  final bool success;
  final String message;
  final int updates;
  final String token;
  final List<Errors> errors;
  final data;

  Response(
      {@required this.success,
      @required this.message,
      @required this.updates,
      @required this.token,
      @required this.errors,
      @required this.data});
  factory Response.fromJson(Map<String, dynamic> json) {
    var list = json['errors'] as List;
    return Response(
        success: json['success'],
        message: json['message'],
        updates: json['updates'],
        token: json['token'],
        errors: list.map((e) => Errors.fromJson(e)).toList(),
        data: json['data']);
  }

  bool get getSuccess {
    return success;
  }

  String get getMessage {
    return message;
  }

  int get getUpdates {
    return updates;
  }

  String get getToken {
    return token;
  }

  List<Errors> get getErrors {
    return errors;
  }

  get getData {
    return data;
  }
}
