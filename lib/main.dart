import 'package:blogapp/blog_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlogListScreen(),
    );
  }
}
