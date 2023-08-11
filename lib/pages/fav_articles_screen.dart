import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'article_page.dart';

class FavArticlesScreen extends StatefulWidget {
  const FavArticlesScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return FavArticlesScreenState();
  }
}

class FavArticlesScreenState extends State<FavArticlesScreen> {
  var collection = FirebaseFirestore.instance.collection("Articles");
  static late List<Map<String, dynamic>> items;
  List<Map<String, dynamic>> articles = [];
  List<String> idList = [];
  static bool isLoaded = false;
  var favArticles = [];
  _readArticlesFromFB() async {
    await FirebaseFirestore.instance
        .collection("Users")
        .where('email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
        .get()
        .then((QuerySnapshot s) {
      s.docs.forEach((element) {
        var data = element.data() as Map<String, dynamic>;
        favArticles = data["favouriteArticles"];
      });
    });
    List<Map<String, dynamic>> tempList = [];
    var data = await collection.get();
    data.docs.forEach((element) {
      var articleData = element.data();
      if (favArticles.contains(articleData["title"])) {
        tempList.add(element.data());
        idList.add(element.reference.id);
      }
    });

    setState(() {
      items = tempList;
      if (articles.isEmpty) {
        articles = tempList;
      }
      isLoaded = true;
    });
  }

  final _searchController = TextEditingController();

  void searchArticle(String query) {
    var result = items.where((item) {
      final articleTitle = item["title"].toLowerCase();
      final input = query.toLowerCase();
      return articleTitle.contains(input);
    }).toList();
    if (query.isEmpty) {
      result = items;
    }
    setState(() {
      articles = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    _readArticlesFromFB();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 114, 114, 144)),
        title: const Text(
          "Favourite Articles",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: _searchController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Search articles...",
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 114, 114, 114),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 114, 114, 114),
                      ),
                    ),
                  ),
                  onChanged: searchArticle,
                ),
              ),
            ),
            Expanded(
              flex: 91,
              child: isLoaded
                  ? ListView.builder(
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ArticlePage(
                                  id: idList[index],
                                  title: articles[index]["title"],
                                  subtitle: articles[index]["subtitle"],
                                  content: articles[index]["content"],
                                  photo: articles[index]["photo"],
                                  date: articles[index]["date"],
                                  numberOfReaders: articles[index]
                                      ["numberOfReaders"],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            height: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 114, 114, 114)),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 40,
                                  child: Container(
                                    margin: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              articles[index]["photo"],
                                            ),
                                            fit: BoxFit.cover),
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                  ),
                                ),
                                Expanded(
                                  flex: 50,
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        right: 8, left: 8),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 10),
                                        Text(
                                          articles[index]["title"],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          articles[index]['subtitle'],
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                          color: Color.fromARGB(
                                              255, 114, 114, 114),
                                        ),
                                      ),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color:
                                            Color.fromARGB(255, 114, 114, 114),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : Text(
                      "There is not article yet.",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
