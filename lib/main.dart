import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:untitled/routes/theme_app_pages.dart';

import 'modules/popular_movie_in_facebook_network/views/movie_network_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movie Network Game',
      getPages: Theme1AppPages.routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MovieNetworkScreen(),
    );
  }
}