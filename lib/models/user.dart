class LoginUser{
  LoginUser({this.username, this.password});

  String? username;
  String? password;
}

class SignUpUser{
  SignUpUser({this.fullName, this.username, this.email, this.dateOfBirth, this.password});

  String? fullName;
  String? username;
  String? email;
  String? dateOfBirth;
  String? password;
}

class User{
  User({this.username, this.imageUrl});

  String? username;
  String? imageUrl;
}