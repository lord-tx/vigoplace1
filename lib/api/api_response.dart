// To parse this JSON data, do
//
//     final apiResponse = apiResponseFromJson(jsonString);

import 'dart:convert';

ApiResponse apiResponseFromJson(String str) => ApiResponse.fromJson(json.decode(str));

class ApiResponse {
  ApiResponse({
    this.flag,
    this.message,
    this.data,
  });

  bool? flag;
  String? message;
  Data? data;

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
    flag: json["flag"] ?? false,
    message: json["message"] ?? "",
    data: Data.fromJson(json["data"]),
  );
}

class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => Data(
  );
}
