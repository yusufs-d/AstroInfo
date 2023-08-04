import 'package:flutter/material.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.content,
    required this.photo,
    required this.date,
    required this.numberOfReaders,
  });

  final String title;
  final String subtitle;
  final String content;
  final String photo;
  final String date;
  final String numberOfReaders;

  @override
  State<StatefulWidget> createState() {
    return ArticlePageState();
  }
}

class ArticlePageState extends State<ArticlePage> {
  Icon unStar = const Icon(Icons.star_border,
      size: 30, color: Color.fromARGB(255, 114, 114, 114));
  Icon star =
      const Icon(Icons.star, size: 30, color: Color.fromARGB(255, 114, 114, 114));
  Icon currentIcon = const Icon(Icons.star_border,
      size: 30, color: Color.fromARGB(255, 114, 114, 114));
  void changeIcon() {
    if (currentIcon == unStar) {
      setState(() {
        currentIcon = star;
      });
    } else {
      setState(() {
        currentIcon = unStar;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: changeIcon,
            child: currentIcon,
          ),
        ],
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 114, 114, 114),
        ),
        title: Text(
          widget.title,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(widget.photo),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.date,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.remove_red_eye,
                  color: Colors.white.withOpacity(0.5),
                  size: 16,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  widget.numberOfReaders.toString(),
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5), fontSize: 16),
                )
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                widget.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            Center(
              child: Text(
                widget.subtitle,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontStyle: FontStyle.italic),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
                width: MediaQuery.of(context).size.width - 30,
                child: Text(
                  widget.content,
                  style: const TextStyle(
                      color: Colors.white, fontSize: 14, letterSpacing: 1.5),
                )),
          ],
        ),
      ),
    );
  }
}
