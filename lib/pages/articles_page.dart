import 'package:astro_info/pages/article_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ArticlesPageState();
  }
}

class _ArticlesPageState extends State<ArticlesPage> {
  var collection = FirebaseFirestore.instance.collection("Articles");
  static late List<Map<String, dynamic>> items;
  List<Map<String, dynamic>> articles = [];
  static bool isLoaded = false;
  _readArticlesFromFB() async {
    List<Map<String, dynamic>> tempList = [];

    var data = await collection.get();
    data.docs.forEach((element) {
      tempList.add(element.data());
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

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 10,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
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
          const SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 90,
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
                                title: articles[index]["title"],
                                subtitle: articles[index]["subtitle"],
                                content: articles[index]["content"],
                                photo: articles[index]["photo"],
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
                                      borderRadius: BorderRadius.circular(40)),
                                ),
                              ),
                              Expanded(
                                flex: 50,
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(right: 8, left: 8),
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
                                        color:
                                            Color.fromARGB(255, 114, 114, 114),
                                      ),
                                    ),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Color.fromARGB(255, 114, 114, 114),
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
    );
  }
}
