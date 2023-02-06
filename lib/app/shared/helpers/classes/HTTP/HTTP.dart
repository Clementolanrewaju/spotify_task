// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:spotify_task/core/setups/envrionment/environment_setup.dart';

class HTTP {
  static String get baseUrl => EnvironmentSetup.baseUrl;
  static final Map<String, String> _headers = Map<String, String>.from(
    {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    },
  );

  static Map<String, String> get _getHeaders =>
      Map<String, String>.from(_headers);

  static List<String> headerLog = [];

  static addHeader({
    required String key,
    required String value,
  }) {
    _headers[key] = value;
    headerLog.add("$key: $value");
  }

  static Future<http.Response> post(
    String endpoint, {
    Encoding? encoding,
    Map<String, String>? preferredHeaders,
    required Map<String, dynamic> body,
  }) async {
    String url = endpoint;
    log(preferredHeaders.toString());
    final response = await http.post(
      Uri.parse(url),
      headers: preferredHeaders ?? _getHeaders,
      encoding: encoding,
      body: body,
    );
    return response;
  }

  static Future<http.Response> get(String endpoint) async {
    String url = endpoint;
    final response = await http.get(
      Uri.parse(url),
      headers: _getHeaders,
    );
    return response;
  }

  static Future<http.Response> put(
    String endpoint, {
    required Map<String, dynamic> body,
  }) async {
    String url = "$baseUrl/$endpoint";
    final response = await http.put(
      Uri.parse(url),
      headers: _getHeaders,
      body: jsonEncode(body),
    );
    return response;
  }

  static Future<http.Response> patch(
    String endpoint, {
    required Map<String, dynamic> body,
  }) async {
    String url = "$baseUrl/$endpoint";
    final response = await http.patch(
      Uri.parse(url),
      headers: _getHeaders,
      body: jsonEncode(body),
    );
    return response;
  }

  static Future<http.Response> delete(
    String endpoint, {
    required Map<String, dynamic> body,
  }) async {
    String url = "$baseUrl/$endpoint";
    final response = await http.delete(
      Uri.parse(url),
      headers: _getHeaders,
      body: jsonEncode(body),
    );
    return response;
  }
}
