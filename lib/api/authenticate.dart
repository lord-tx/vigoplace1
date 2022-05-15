import 'package:shared_preferences/shared_preferences.dart';
import 'package:vigoplace1/api/api.dart';
import 'package:vigoplace1/api/api_type.dart';
import 'package:vigoplace1/models/user.dart';

Api api = Api();

Future<Map<String, dynamic>> login(LoginUser user) async {
  Map<String, dynamic> result = await api.apiPost(ApiPostType.login, values: {
    "username" : user.username,
    "password" : user.password,
  });
  if (result["success"]){
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', '${user.username}');
    await prefs.setString('password', '${user.password}');
  }
  return result;
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