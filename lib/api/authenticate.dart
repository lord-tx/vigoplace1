import 'package:vigoplace1/api/api.dart';
import 'package:vigoplace1/api/api_type.dart';
import 'package:vigoplace1/models/user.dart';

Api api = Api();

void login(LoginUser user){
  api.apiPost(ApiPostType.login, values: {
    "username" : user.username,
    "password" : user.password,
  });
}

void signUp(SignUpUser user){
  api.apiPost(ApiPostType.signUp, values: {
    "fullname"    : user.fullName,
    "username"    : user.username,
    "email"       : user.email,
    "dob"         : user.dateOfBirth,
    "password"    : user.password
  });
}