import 'package:flutter/material.dart';

import 'bussiness.dart';
import 'google_review.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Google Review',
      home: BusinessScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
