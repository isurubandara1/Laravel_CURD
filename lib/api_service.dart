import 'dart:convert';
import 'package:blogapp/blog.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://192.168.134.44:8000/api/blog';

  Future<List<Blog>> fetchBlogs() async {
    final response = await http.get(Uri.parse('$baseUrl'));

    if (response.statusCode == 200) {
      List blogs = json.decode(response.body);
      return blogs.map((blog) => Blog.fromJson(blog)).toList();
    } else {
      throw Exception('Failed to load blogs');
    }
  }
}
