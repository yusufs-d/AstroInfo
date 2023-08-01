import 'package:astro_info/firebase_options.dart';
import 'package:astro_info/layout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(
    MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(useMaterial3: true),
      home: const LayoutWidget(),
    )
  );




}