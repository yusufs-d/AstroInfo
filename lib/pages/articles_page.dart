import 'package:astro_info/model_lists/articles_list.dart';
import 'package:astro_info/models/article.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ArticlesPageState();
  }
}

class _ArticlesPageState extends State<ArticlesPage> {



  List<Article> articles = articlesList;
  final _searchController = TextEditingController();

  Widget listItem({required Map article}){
    return InkWell(
                    onTap: (){},
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      height: 150,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: const Color.fromARGB(255, 114, 114, 114)),
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
                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/NGC7293_%282004%29.jpg/1200px-NGC7293_%282004%29.jpg"),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(40)),
                            ),
                          ),
                          Expanded(
                            flex: 50,
                            child: Container(
                              margin: const EdgeInsets.only(right: 8, left: 8),
                              child: Column(
                                children: [
                                  SizedBox(height: 10),
                                  Text(
                                    article['title'],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    article['subtitle'],
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
                                    color: Color.fromARGB(255, 114, 114, 114),
                                  ),
                                  
                                ),
                                
                              ),
                              child: const Center(child: Icon(Icons.arrow_forward_ios,color: Color.fromARGB(255, 114, 114, 114),),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
  }
  void searchArticle(String query) {
    var result = articles.where((article) {
      final articleTitle = article.title.toLowerCase();
      final input = query.toLowerCase();
      return articleTitle.contains(input);
    }).toList();
    if (query.isEmpty) {
      result = articlesList;
    }
    setState(() {
      articles = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    final firebaseApp = Firebase.app();
final Query dbRef = FirebaseDatabase.instanceFor(app: firebaseApp, databaseURL: 'https://astroinfo-95c4f-default-rtdb.europe-west1.firebasedatabase.app').ref("Articles");
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
            child: FirebaseAnimatedList(query: dbRef,itemBuilder:(context, snapshot, animation, index) {
              Map article = snapshot.value as Map;
              article['key'] = snapshot.key;
              return listItem(article: article);
            },)
          )
        ],
      ),
    );
  }
}

