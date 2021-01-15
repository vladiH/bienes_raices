import 'package:flutter/material.dart';

class Errors {
  final String message;
  final String path;

  Errors({@required this.message, @required this.path});

  factory Errors.fromJson(Map<String, dynamic> json) {
    return Errors(message: json['message'], path: json['path']);
  }
  String get getMessage => message;
}
