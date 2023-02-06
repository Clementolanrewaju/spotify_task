// To parse this JSON data, do
//
//     final getTokenModelResponse = getTokenModelResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetTokenModelResponse getTokenModelResponseFromJson(String str) => GetTokenModelResponse.fromJson(json.decode(str));

String getTokenModelResponseToJson(GetTokenModelResponse data) => json.encode(data.toJson());

class GetTokenModelResponse {
  GetTokenModelResponse({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
  });

  final String accessToken;
  final String tokenType;
  final int expiresIn;

  factory GetTokenModelResponse.fromJson(Map<String, dynamic> json) => GetTokenModelResponse(
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    expiresIn: json["expires_in"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "token_type": tokenType,
    "expires_in": expiresIn,
  };
}
