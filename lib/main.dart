import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/user_m.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // primarySwatch: primaryColor,
          ),
      home: const UserManage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
