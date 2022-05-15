import 'dart:convert';

import 'package:flutter/foundation.dart';
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

  Future<bool> apiPost(ApiPostType requestType, {Map<String, dynamic>? values}) async {

    switch(requestType){

      case ApiPostType.login:
        if (values == null || values.length < ApiType.requiredValueSize(ApiPostType, ApiPostType.login)){
          return false;
        }
        return processPostRequest(loginUrl, values);
      case ApiPostType.signUp:
        if (values == null || values.length < ApiType.requiredValueSize(ApiPostType, ApiPostType.signUp)){
          return false;
        }
        return processPostRequest(signUpUrl, values);
      case ApiPostType.addPost:
        if (values == null || values.length < ApiType.requiredValueSize(ApiPostType, ApiPostType.addPost)){
          return false;
        }
        break;
    }

    return Future.delayed(const Duration(seconds: 1), (){
      return true;
    });
  }

  Future<bool> processPostRequest(String url, dynamic data) async {
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
        break;
      case 400:
        if(kDebugMode){
          print(response.body);
        }
    }
    return false;
  }
}