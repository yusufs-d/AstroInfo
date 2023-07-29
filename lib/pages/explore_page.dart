import 'package:astro_info/model_lists/articles_list.dart';
import 'package:astro_info/utils/category_list.dart';
import 'package:astro_info/model_lists/objects_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:astro_info/models/object.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExplorePageState();
  }
}

class _ExplorePageState extends State<ExplorePage> {
  


  int _tabIndex = 0;
  List<Object> objectsToShow = objectList;
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
    readObjectFromFb();
    List<Object> selectCategory(String categoryName) {
      return objectList
          .where((object) => object.category.name == categoryName)
          .toList();
    }

    ;
    List<String> categories = [
      "All",
      "Planets",
      "Stars",
      "Nebulas",
      "Galaxies",
      "Black Holes",
      "Neutron Stars"
    ];

    final planets =
        objectList.where((object) => object.category.name == "planet").toList();
    final stars =
        objectList.where((object) => object.category.name == "star").toList();
    final nebulas =
        objectList.where((object) => object.category.name == "nebula").toList();
    final galaxies =
        objectList.where((object) => object.category.name == "galaxy").toList();
    final blackHoles = objectList
        .where((object) => object.category.name == "blackHole")
        .toList();
    final neutronStars = objectList
        .where((object) => object.category.name == "neutronStar")
        .toList();

    final double w = MediaQuery.of(context).size.width;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
                              objectsToShow = objectList;
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
                            borderRadius: BorderRadius.circular(18),
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
            Expanded(
              child: GridView.builder(
                  itemCount: objectsToShow.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 2.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 90,
                              child: Image.asset(objectsToShow[index].photo),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              flex: 10,
                              child: Text(
                                objectsToShow[index].name,
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
    );
  }
}
