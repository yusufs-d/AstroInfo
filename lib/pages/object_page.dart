import 'package:flutter/material.dart';

class ObjectPage extends StatefulWidget {
  const ObjectPage({
    super.key,
    required this.name,
    required this.subtitle,
    required this.content,
    required this.photo,
  });

  final String name;
  final String subtitle;
  final String content;
  final String photo;

  @override
  State<StatefulWidget> createState() {
    return ObjectPageState();
  }
}

class ObjectPageState extends State<ObjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 114, 114, 114),
        ),
        title: Text(
          widget.name,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
    );
  }
}
