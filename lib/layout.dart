import 'package:flutter/material.dart';
import 'package:astro_info/utils/bottom_navigation.dart';

class LayoutWidget extends StatefulWidget {
  const LayoutWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LayoutWidgetState();
  }
}

class _LayoutWidgetState extends State<LayoutWidget> {
  @override
  Widget build(BuildContext context) {
   return const BottomNavigationBarWidget();
  }
}