// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'object_screen/object_screen.dart';

class FavObjectsScreen extends StatefulWidget {
  const FavObjectsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return FavObjectsScreenState();
  }
}

class FavObjectsScreenState extends State<FavObjectsScreen> {
  var collection = FirebaseFirestore.instance.collection("SpaceObjects");
  static late List<Map<String, dynamic>> items;
  List<Map<String, dynamic>> objectsToShow = [];
  var favObjects = [];

  _readObjectsFromFB() async {
    await FirebaseFirestore.instance
        .collection("Users")
        .where('email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
        .get()
        .then((QuerySnapshot s) {
      s.docs.forEach((element) {
        var data = element.data() as Map<String, dynamic>;
        favObjects = data["favouriteObjects"];
      });
    });
    List<Map<String, dynamic>> tempList = [];

    var data = await collection.get();
    data.docs.forEach((element) {
      var objectData = element.data();
      if (favObjects.contains(objectData["name"])) {
        tempList.add(element.data());
      }
    });

    setState(() {
      items = tempList;
      if (objectsToShow.isEmpty) {
        objectsToShow = tempList;
      }
    });
  }

  int _tabIndex = 0;

  List<String> category_tags = [
    "all",
    "planet",
    "star",
    "nebula",
    "galaxy",
    "blackHole",
    "neutronStar"
  ];
  @override
  Widget build(BuildContext context) {
    _readObjectsFromFB();
    List<Map<String, dynamic>> selectCategory(String categoryName) {
      return items
          .where((object) => object["category"] == categoryName)
          .toList();
    }

    List<String> categories = [
      "All",
      "Planets",
      "Stars",
      "Nebulas",
      "Galaxies",
      "Black Holes",
      "Neutron Stars"
    ];
    final double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 114, 114, 144)),
        title: const Text(
          "Favourite Objects",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 8,
              ),
              Container(
                  width: w,
                  height: 56,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (BuildContext context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              _tabIndex = index;
                              if (category_tags[index] == "all") {
                                objectsToShow = items;
                              } else {
                                objectsToShow =
                                    selectCategory(category_tags[index]);
                              }
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 6),
                            width: 100,
                            decoration: BoxDecoration(
                              color: _tabIndex == index
                                  ? Color.fromARGB(255, 114, 114, 114)
                                  : Colors.black,
                              border: Border.all(
                                  color: Color.fromARGB(255, 114, 114, 114),
                                  width: 2),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(categories[index],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center),
                              ],
                            ),
                          ),
                        );
                      })),
              SizedBox(
                height: 8,
              ),
              Expanded(
                child: GridView.builder(
                    itemCount: objectsToShow.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2.0,
                      mainAxisSpacing: 2.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ObjectPage(
                                name: objectsToShow[index]["name"],
                                subtitle: objectsToShow[index]["subtitle"],
                                content: objectsToShow[index]["content"],
                                photo: objectsToShow[index]["photo"],
                                category: objectsToShow[index]["category"],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 90,
                                child:
                                    Image.asset(objectsToShow[index]["photo"]),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                flex: 10,
                                child: Text(
                                  objectsToShow[index]["name"],
                                  style: GoogleFonts.lato(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
