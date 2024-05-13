import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Blog')),
      body: Center(
        child: Text('Welcome to the Blog!'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to blog post creation screeng
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class BlogPostCreationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Blog Post')),
      body: Center(
        child: Text('Create your blog post here'),
      ),
    );
  }
}

class BlogPost {
  final String author;
  final String content;

  BlogPost({required this.author, required this.content});
}

class BlogPostList extends StatelessWidget {
  final List<BlogPost> posts;

  BlogPostList({required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return ListTile(
          title: Text(post.content),
          subtitle: Text('by ${post.author}'),
        );
      },
    );
  }
}
