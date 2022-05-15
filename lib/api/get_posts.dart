import 'package:vigoplace1/api/api.dart';
import 'package:vigoplace1/api/api_type.dart';

Api api = Api();

void getPosts(){
  api.apiGet(ApiGetType.getPost);
}