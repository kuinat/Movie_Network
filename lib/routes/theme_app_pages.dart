import 'package:get/get.dart' show GetPage, Transition;
import 'package:untitled/modules/popular_movie_in_facebook_network/bindings/movie_network_binding.dart';
import 'package:untitled/modules/popular_movie_in_facebook_network/views/movie_network_screen.dart';


import 'app_routes.dart';

class Theme1AppPages {

  static final routes = [
    //GetPage(name: Routes.ROOT, page: () => RootView(), binding: RootBinding()),
    GetPage(name: Routes.HOME, page: () => MovieNetworkScreen(), binding: MovieNetworkBinding()),


  ];
}
