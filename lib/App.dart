// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'Pages/HomeScreen/HomeScreen.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Fade-in and Fade-out';
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: HomeScreen(),
    );
  }
}
