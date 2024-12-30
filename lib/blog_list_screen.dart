import 'package:blogapp/api_service.dart';
import 'package:blogapp/blog.dart';
import 'package:flutter/material.dart';

class BlogListScreen extends StatefulWidget {
  @override
  _BlogListScreenState createState() => _BlogListScreenState();
}

class _BlogListScreenState extends State<BlogListScreen> {
  final ApiService apiService = ApiService();
  late Future<List<Blog>> futureBlogs;

  @override
  void initState() {
    super.initState();
    futureBlogs = apiService.fetchBlogs();
  }

  Future<void> _refreshBlogs() async {
    setState(() {
      futureBlogs =
          apiService.fetchBlogs(); // Refresh data by re-fetching blogs
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Blogs')),
      body: FutureBuilder<List<Blog>>(
        future: futureBlogs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No blogs found'));
          } else {
            final blogs = snapshot.data!;
            return RefreshIndicator(
              onRefresh: _refreshBlogs, // Triggered when user pulls to refresh
              child: ListView.builder(
                itemCount: blogs.length,
                itemBuilder: (context, index) {
                  final blog = blogs[index];
                  return Card(
                    child: ListTile(
                      leading: Image.network(
                        'http://192.168.134.44:8000//storage/${blog.imageUrl}',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(blog.topic),
                      subtitle: Text(blog.description),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
