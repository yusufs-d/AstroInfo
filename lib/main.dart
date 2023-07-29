import 'package:astro_info/firebase_options.dart';
import 'package:astro_info/layout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const LayoutWidget(),
    )
  );
}