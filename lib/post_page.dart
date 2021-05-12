import 'package:flutter/material.dart';
import 'package:http_request/http_services.dart';
import 'package:http_request/post_details.dart';
import './Post.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final HttpServices httpServices = HttpServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post'),
      ),
      body: FutureBuilder(
        future: httpServices.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            List<Post> posts = snapshot.data;
            return ListView(
              children: posts
                  .map((Post post) => ListTile(
                        title: Text(
                          post.title,
                          style: TextStyle(fontSize: 18.0),
                        ),
                        subtitle: Text(post.id.toString()),
                      ))
                  .toList(),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
