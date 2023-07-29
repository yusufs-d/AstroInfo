import 'package:astro_info/pages/articles_page.dart';
import 'package:astro_info/pages/explore_page.dart';
import 'package:astro_info/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = [
    HomePage(),
    ExplorePage(),
    ArticlesPage(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AstroInfo',
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedIconTheme:
            const IconThemeData(color: Color.fromARGB(255, 142, 0, 174)),
        unselectedIconTheme: const IconThemeData(color: Colors.white),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,size: 36,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.shuttleSpace,size: 30,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(Icons.article,size: 36,),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
