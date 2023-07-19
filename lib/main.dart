import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_example/Screens/addNotes.dart';
import 'package:firebase_example/Screens/homePage.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_example/Screens/update.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      title: 'Firebase todo',
      routes: {
        '/home': (context) => const HomePage(),
        '/add': (context) => const AddNotes(),
        '/update': (context) => const UpdateData(),
      },
      initialRoute: '/home',
    );
  }
}
