import './Post.dart';
import 'package:flutter/material.dart';

class PostDetails extends StatelessWidget {
  final Post post;
  PostDetails({@required this.post});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
    );
  }
}
