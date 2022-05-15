import 'package:vigoplace1/api/api.dart';
import 'package:vigoplace1/api/api_type.dart';
import 'package:vigoplace1/models/user.dart';

Api api = Api();

Future<Map<String, dynamic>> login(LoginUser user) async {
  return api.apiPost(ApiPostType.login, values: {
    "username" : user.username,
    "password" : user.password,
  });
}

Future<Map<String, dynamic>> signUp(SignUpUser user){
  return api.apiPost(ApiPostType.signUp, values: {
    "fullname"    : user.fullName,
    "username"    : user.username,
    "email"       : user.email,
    "dob"         : user.dateOfBirth,
    "password"    : user.password
  });
}