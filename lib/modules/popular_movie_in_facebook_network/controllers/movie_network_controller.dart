
import 'dart:collection';
import 'package:get/get.dart';

import '../../../model/movie.dart';
import '../../../model/person.dart';

class MovieNetworkController extends GetxController{
var persons = [];
var movies =[];
var your_name = '';
List<Movie> my_movies = [];
var my_movies_obx = [].obs;
List<Person> my_friends = [];
var my_friends_obx = [].obs;
late Movie movie1;
late Movie movie2;
late Movie movie3;
late Movie movie4 ;
var most_played_film = '';

var movies_selected_index = 0;
var friends_selected_index = 0;

var played = false.obs;

late Person alice;
late Person bob;
late Person charlie;


  @override
  void onInit() async {
     movie1 = Movie('Inception');
     movie2 = Movie('Interstellar');
     movie3 = Movie('The Dark Knight');
     movie4 = Movie('Memento');
     movies.add(movie1);
     movies.add(movie2);
     movies.add(movie3);
     movies.add(movie4);
     alice = Person('Alice', [movie1, movie2], []);
     bob = Person('Bob', [movie1, movie3], []);
     charlie = Person('Charlie', [movie2, movie3, movie4], []);
     alice.friends.addAll([bob, charlie]);
     bob.friends.add(charlie);
     charlie.friends.add(bob);
     persons.add(alice);
     persons.add(bob);
     persons.add(charlie);

  }
  String getMostPopularMovie(Person person) {
  final movieCount = HashMap<Movie, int>();
  final visited = HashSet<Person>();

  void countMovies(Person p) {
    if (visited.contains(p)) return;
    visited.add(p);
    for (var movie in p.likedMovies) {
      movieCount[movie] = (movieCount[movie] ?? 0) + 1;
    }
    for (var friend in p.friends) {
      countMovies(friend);
    }
  }

  countMovies(person);

  var mostPopularMovie = '';
  var highestCount = 0;

  movieCount.forEach((movie, count) {
    if (count > highestCount) {
      highestCount = count;
      mostPopularMovie = movie.name;
    }
  });
  played.value = true;

  return mostPopularMovie;
}

}