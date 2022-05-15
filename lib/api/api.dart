import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:vigoplace1/api/api_response.dart';
import 'package:vigoplace1/api/api_type.dart';
import 'package:http/http.dart' as http;
import 'package:vigoplace1/api/api_urls.dart';

class Api{
  Future<bool> apiGet(ApiGetType requestType, {Map<String, dynamic>? values}) async {
    switch (requestType){
      case ApiGetType.getUser:
        // TODO: Handle this case.
        break;
      case ApiGetType.getPost:
        // TODO: Handle this case.
        break;
    }

    return Future.delayed(const Duration(seconds: 1), (){
      return true;
    });
  }

  Future<Map<String, dynamic>> apiPost(ApiPostType requestType, {Map<String, dynamic>? values}) async {

    switch(requestType){

      case ApiPostType.login:
        if (values == null || values.length < ApiType.requiredValueSize(ApiPostType, ApiPostType.login)){
          return {"success" : false};
        }
        return processPostRequest(loginUrl, values);
      case ApiPostType.signUp:
        if (values == null || values.length < ApiType.requiredValueSize(ApiPostType, ApiPostType.signUp)){
          return {"success" : false};
        }
        return processPostRequest(signUpUrl, values);
      case ApiPostType.addPost:
        if (values == null || values.length < ApiType.requiredValueSize(ApiPostType, ApiPostType.addPost)){
          return {"success" : false};
        }
        break;
    }

    return Future.delayed(const Duration(seconds: 1), (){
      return {"success" : false};
    });
  }

  Future<Map<String, dynamic>> processPostRequest(String url, dynamic data) async {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: data,
    );

    if(kDebugMode){
      print(response.statusCode);
    }

    switch(response.statusCode){
      case 200:
        if(kDebugMode){
          print("Success");
        }
        return {"success" : true};
    }

    ApiResponse apiResponse = apiResponseFromJson(response.body);
    if(kDebugMode){
      print(apiResponse.message);
    }
    return {"success" : false, "message" : apiResponse.message};
  }
}