import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vigoplace1/models/post.dart';

class VigoPost extends StatefulWidget {
  const VigoPost({Key? key, this.post}) : super(key: key);

  final Post? post;

  @override
  State<VigoPost> createState() => _VigoPostState();
}

class _VigoPostState extends State<VigoPost> {

  /// Debug Defaults
  bool favorite = false;
  int favorites = 0;
  int comments = 0;

  @override
  void initState(){
    super.initState();
    favorites = widget.post?.likes ?? 0;
    comments = widget.post?.comments ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: double.infinity,),
      child: IntrinsicHeight(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle
                  ),
                  child: Image.network(
                    widget.post?.user?.imageUrl ?? "",
                    errorBuilder: (context, object, trace){
                      return Image.asset("assets/images/default_post_image.png");
                    },
                  ),
                ),
              ),
              title: Text(widget.post?.user?.username ?? ""),
              subtitle: Text(DateFormat('EE, d MMM yy').format(widget.post?.postTime ?? DateTime.fromMicrosecondsSinceEpoch(1234567)),),
              trailing: PopupMenuButton(
                itemBuilder: (BuildContext context) {
                  return [
                    const PopupMenuItem(
                      child: Text("Option1")
                    ),
                    const PopupMenuItem(
                        child: Text("Option2")
                    )
                  ];
                },
              ),
            ),
            Divider(),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 5),
              child: Text(
                widget.post?.postText ?? ""
              ),
            ),
            Image.network(
              widget.post?.postUrl ?? "",
              errorBuilder: (context, object, trace){
                return Image.asset("assets/images/default_post_image.png");
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: (){
                    setState(() {
                      if (favorite){
                        favorites--;
                      } else {
                        favorites++;
                      }
                      favorite = favorite ? false : true;
                    });
                  },
                  icon: favorite ? const Icon(Icons.favorite, color: Colors.red,) : const Icon(Icons.favorite_border_outlined)
                ),
                Text("$favorites"),
                IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.comment_rounded)
                ),
                Text("$comments"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
