import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/controller/editstore.dart';
import 'package:testproject/view/editstore.dart';
import 'package:testproject/view/home_screen.dart';
import 'package:testproject/view/stampdetails.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'test project',
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        Get.put(EditStoreProfileController());
      }),
      home: 
      // HomeScreen()
      // StampDetailsScreen()
      EditStoreProfileScreen()
      ,
    );
  }
}
