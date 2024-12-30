class Blog {
  final String topic;
  final String description;
  final String imageUrl;

  Blog(
      {required this.topic, required this.description, required this.imageUrl});

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      topic: json['topic'],
      description: json['description'],
      imageUrl: json['image'],
    );
  }
}
