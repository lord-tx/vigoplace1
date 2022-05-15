
/// Describes the API call types and values
enum ApiGetType{
  /// Get Requests can be added here
  getUser,
  getPost,
}

enum ApiPostType{
  /// Set to authenticate for login and signUp
  login,
  signUp,
  /// Post Requests can be added here
  addPost,
}

class ApiType{
  static int requiredValueSize(dynamic valueType, dynamic value){
    if (valueType.runtimeType == ApiPostType){
      switch (value){

        case ApiPostType.login:
          return 2;
        case ApiPostType.signUp:
          return 5;
        case ApiPostType.addPost:
          return 2;
      }
    }

    if (valueType.runtimeType == ApiGetType){
      switch (value){

        case ApiPostType.login:
          return 0;
        case ApiPostType.signUp:
          return 0;
        case ApiPostType.addPost:
          return 0;
      }
    }

    return 0;
  }
}