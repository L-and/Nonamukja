import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth {
  Map<String, dynamic> _json = {};

  Map<String, dynamic> get json => _json;

  set json(Map<String, dynamic> input_json) {
    _json = input_json;
  }
}