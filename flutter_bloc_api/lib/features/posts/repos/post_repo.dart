import 'dart:convert';

import 'package:flutter_bloc_api/features/posts/models/post_data_ui_model.dart';
import 'package:http/http.dart' as http;

class PostRepo {
  static Future<List<PostDataUIModel>> fetchPost() async {
    var client = http.Client();
    List<PostDataUIModel> posts = [];
    try {
      var response = await client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/'));
      if (response.statusCode == 200) {
        List result = jsonDecode(response.body);
        for (int i = 0; i < result.length; i++) {
          PostDataUIModel post = PostDataUIModel.fromMap(result[i]);
          posts.add(post);
        }
        return posts;
      } else {
        print('fetch failed');
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  static Future<bool> addPost() async {
    var client = http.Client();

    try {
      var response = await client.post(
          Uri.parse('https://jsonplaceholder.typicode.com/posts/'),
          body: {
            "title": 'Ema is a teacher',
            "body": "She is from India",
            "userId": '34'
          });

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
