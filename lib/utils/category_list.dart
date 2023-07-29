import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget{
  const CategoryList({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CategoryListState();
  }
}

class _CategoryListState extends State<CategoryList>{
  
  int _tabIndex = 0;
  

  @override
  Widget build(BuildContext context) {

  List<Widget> categories = [
    InkWell(
      onTap: (){
        setState(() {
          
          _tabIndex = 0;
          
          
        });
      },

      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        width: 100,
        decoration: BoxDecoration(
          color: _tabIndex == 0 ? Color.fromARGB(255, 114, 114, 114) : Colors.black,
          border: Border.all(
            color: Color.fromARGB(255, 114, 114, 114),
            width: 2
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child:  const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "All",
                style:
                     TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    ),
    InkWell(
      onTap: (){
        setState(() {
          
          _tabIndex = 1;
          
        });
      },

      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        width: 100,
        decoration: BoxDecoration(
          color: _tabIndex == 1 ? Color.fromARGB(255, 114, 114, 114) : Colors.black,
          border: Border.all(
            color: const Color.fromARGB(255, 114, 114, 114),
            width: 2
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child:  const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Planets",
                style:
                     TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    ),
    InkWell(
      onTap: (){
        setState(() {
          
          _tabIndex = 2;
          
        });
      },

      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        width: 100,
        decoration: BoxDecoration(
          color: _tabIndex == 2 ? Color.fromARGB(255, 114, 114, 114) : Colors.black,
          border: Border.all(
            color: const Color.fromARGB(255, 114, 114, 114),
            width: 2
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child:  const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Stars",
                style:
                     TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    ),
    InkWell(
      onTap: (){
        setState(() {
          
          _tabIndex = 3;
          
        });
      },

      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        width: 100,
        decoration: BoxDecoration(
          color: _tabIndex == 3 ? Color.fromARGB(255, 114, 114, 114) : Colors.black,
          border: Border.all(
            color: const Color.fromARGB(255, 114, 114, 114),
            width: 2
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child:  const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Nebulas",
                style:
                     TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    ),
    InkWell(
      onTap: (){
        setState(() {
          
          _tabIndex = 4;
          
        });
      },

      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        width: 100,
        decoration: BoxDecoration(
          color: _tabIndex == 4 ? Color.fromARGB(255, 114, 114, 114) : Colors.black,
          border: Border.all(
            color: const Color.fromARGB(255, 114, 114, 114),
            width: 2
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child:  const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Galaxies",
                style:
                     TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    ),
    InkWell(
      onTap: (){
        setState(() {
          
          _tabIndex = 5;
          
        });
      },

      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        width: 100,
        decoration: BoxDecoration(
          color: _tabIndex == 5 ? Color.fromARGB(255, 114, 114, 114) : Colors.black,
          border: Border.all(
            color: const Color.fromARGB(255, 114, 114, 114),
            width: 2
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child:  const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Black Holes",
                style:
                     TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    ),
    InkWell(
      onTap: (){
        setState(() {
          
          _tabIndex = 6;
          
        });
      },

      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        width: 100,
        decoration: BoxDecoration(
          color: _tabIndex == 6 ? Color.fromARGB(255, 114, 114, 114) : Colors.black,
          border: Border.all(
            color: const Color.fromARGB(255, 114, 114, 114),
            width: 2
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child:  const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Neutron Stars",
                style:
                     TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    ), 
  ];


    return ListView(
                  scrollDirection: Axis.horizontal,
                  children: categories,
    );
    

  }

}