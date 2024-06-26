import 'package:flutter/material.dart';
import 'package:flutter_bloc_api/features/home/home_page.dart';
import 'package:flutter_bloc_api/features/posts/UI/posts_page.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:PostPage(),
    );
  }
}