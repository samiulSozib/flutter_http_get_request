import 'dart:convert';
import 'package:http/http.dart';

import './Post.dart';

class HttpServices {
  //final String postsUrl = Uri.parse("https://jsonplaceholder.typicode.com/posts");
  var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

  Future<List<Post>> getPosts() async {
    Response res = await get(url);

    //var res = await http.get(url);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts =
          body.map((dynamic item) => Post.fromJson(item)).toList();
      return posts;
    } else {
      throw "Can't get post";
    }
  }
}
