import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:untitled/modules/popular_movie_in_facebook_network/controllers/movie_network_controller.dart';

void main() {
  late MovieNetworkController controller;

  setUp(() {
    controller = MovieNetworkController();
    controller.onInit();
  });

  test('Initial movies and persons are set correctly', () {
    expect(controller.movies.length, 4);
    expect(controller.persons.length, 3);
  });

  test('Get most popular movie for Alice', () {
    final mostPopularMovie = controller.getMostPopularMovie(controller.alice);
    expect(mostPopularMovie, 'The Dark Knight');
    expect(controller.played.value, true);
  });

  test('Get most popular movie for Bob', () {
    final mostPopularMovie = controller.getMostPopularMovie(controller.bob);
    expect(mostPopularMovie, 'The Dark Knight');
    expect(controller.played.value, true);
  });

  test('Get most popular movie for Charlie', () {
    final mostPopularMovie = controller.getMostPopularMovie(controller.charlie);
    expect(mostPopularMovie, 'The Dark Knight');
    expect(controller.played.value, true);
  });
}
