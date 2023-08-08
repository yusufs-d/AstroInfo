import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({
    super.key,
    required this.id,
    required this.title,
    required this.subtitle,
    required this.content,
    required this.photo,
    required this.date,
    required this.numberOfReaders,
  });

  final String id;
  final String title;
  final String subtitle;
  final String content;
  final String photo;
  final String date;
  final int numberOfReaders;

  @override
  State<StatefulWidget> createState() {
    return ArticlePageState();
  }
}

class ArticlePageState extends State<ArticlePage> {
  static Icon unStar = const Icon(Icons.star_border,
      size: 30, color: Color.fromARGB(255, 114, 114, 114));
  Icon star = const Icon(Icons.star,
      size: 30, color: Color.fromARGB(255, 114, 114, 114));
  Icon currentIcon = unStar;
  _checkIsClicked() async {
    FirebaseFirestore.instance
        .collection("Users")
        .where('email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
        .get()
        .then((QuerySnapshot s) {
      s.docs.forEach((element) {
        var userID = element.reference.id;
        var data = element.data() as Map<String, dynamic>;
        var clickedList = data["clickedArticles"];
        var favArticles = data["favouriteArticles"];
        var numberOfArticlesToRead = data["numberOfArticlesToRead"];
        if(favArticles.contains(widget.title))
        {
          setState(() {
            currentIcon = star;
          });
          
        }
        if (!clickedList.contains(widget.title)) {
          FirebaseFirestore.instance.collection("Users").doc(userID).update({
            "clickedArticles": FieldValue.arrayUnion([widget.title]),
            "numberOfArticlesToRead": numberOfArticlesToRead - 1
          });
          setState(() {
            FirebaseFirestore.instance
                .collection("Articles")
                .doc(widget.id)
                .update({
              "numberOfReaders": widget.numberOfReaders + 1,
            });
          });
        }
      });
    });
  }


  void addFavourite() {
    if (currentIcon == unStar) {
      setState(() {
        currentIcon = star;
      });

      FirebaseFirestore.instance
          .collection("Users")
          .where('email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
          .get()
          .then((QuerySnapshot s) {
        String userID = s.docs[0].reference.id;

        List<String> favArticles = [widget.title];
        FirebaseFirestore.instance
            .collection("Users")
            .doc(userID)
            .update({"favouriteArticles": FieldValue.arrayUnion(favArticles)});
      });
    } else {
      setState(() {
        currentIcon = unStar;
      });
      FirebaseFirestore.instance
          .collection("Users")
          .where('email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
          .get()
          .then((QuerySnapshot s) {
        String userID = s.docs[0].reference.id;

        List<String> favArticles = [widget.title];
        FirebaseFirestore.instance
            .collection("Users")
            .doc(userID)
            .update({"favouriteArticles": FieldValue.arrayRemove(favArticles)});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _checkIsClicked();
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: addFavourite,
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
