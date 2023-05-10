import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pattern_getx/pages/home_page.dart';
import 'package:pattern_getx/pages/main_page.dart';
import 'package:pattern_getx/pages/splash_page.dart';
import 'package:pattern_getx/pages/starter_page.dart';
import 'package:pattern_getx/services/bind_services.dart';
import 'package:pattern_getx/services/di_services.dart';

void main() async{
  await DIService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StarterPage(),
      //initialBinding: BindService(),
      //getPages: [
        //GetPage(
          //name: MainPage.id,
          //page: () => const MainPage(),
          //binding: BindService(),
        //),
      //],
    );
  }
}

