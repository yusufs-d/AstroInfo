import 'package:flutter/material.dart';

class ArticlePage extends StatefulWidget {
  ArticlePage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.content,
    required this.photo,
  });

  final String title;
  final String subtitle;
  final String content;
  final String photo;

  @override
  State<StatefulWidget> createState() {
    return ArticlePageState();
  }
}

class ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 114, 114, 114),),
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
    );
  }
}
