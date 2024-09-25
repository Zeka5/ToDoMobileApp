import 'package:flutter/material.dart';
import 'package:todo_list_app/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //local data storage
  await Hive.initFlutter();

  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primaryColor: Colors.blue),
    );
  }
}
