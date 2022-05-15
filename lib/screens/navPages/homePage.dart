import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vigoplace1/models/post.dart';
import 'package:vigoplace1/models/user.dart';
import 'package:vigoplace1/widgets/vigo_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  /// Dummy data
  VigoPost myPost = VigoPost(
    post: Post(
      postText: """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Feugiat tristique in morbi nunc enim vitae. Gravida facilisis sit lobortis eget. Lorem faucibus vulputate purus viverra eu elit nec nisl.""",
      postUrl: "",
      user: User(
        username: "robertfox",
        imageUrl: "https://s3-alpha-sig.figma.com/img/84b9/9884/8572cccd5607b2e036623e2e3c7f5a6b?Expires=1653264000&Signature=FlZoLaTQtWl5mNELyzvqowwSJwBNM9MflHZnLu-kaz4nMJCWqGOxltEHM490jsNMcuqsFGG1gXwJHRlsVsZQPmbI0Hy2zX~2bclsK3lcXqFAW~nyJDVFhcIGgQjUvYuUlp9cDyQ7fBI2Dbv9oYfCq9629h1TG~4uyZj2WlJj7YTaiA3r4rXEWH9VdnFaGd4eQGORZjyPVRAFzDarfGnY28PXuyrVLhOEYMuhEeXxnjWNDqhkW8~ENTfgaujSyBS8a-DzT-hsSkV~ySu4TTgB8zeFbTCP6sxlJYj2SIIRD4okgy8~Ik2MuLF0vl4n56vwXA1OwnAgPUFpRhMnCvejDA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
      ),
      likes: 0,
      postTime: DateTime.now(),
      comments: 0,
    )
  );

  /// Dummy value
  bool refreshed = false;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        refreshed = true;
        await Future.delayed(const Duration(seconds: 2), (){
          refreshed = false;
        });
      },
      child: ListView.builder(
          itemCount: 5,// empList.length,
          itemBuilder: (context, index){
            return myPost;
          }
      ),
    );
  }
}
