import 'package:get/get.dart';
import 'package:untitled/modules/popular_movie_in_facebook_network/controllers/movie_network_controller.dart';

class MovieNetworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieNetworkController>(
          () => MovieNetworkController(),
    );

  }
}
