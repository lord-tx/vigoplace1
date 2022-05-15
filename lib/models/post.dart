import 'package:vigoplace1/models/user.dart';

class Post{
  Post({this.postId, this.postText, this.postUrl, this.user, this.postTime, this.likes, this.comments});

  String? postId;
  String? postText;
  String? postUrl;
  User? user;
  int? likes;
  int? comments;
  DateTime? postTime;
}