import 'movie.dart';

class Person {
  final String name;
  final List<Movie> likedMovies;
  final List<Person> friends;

  Person(this.name, this.likedMovies, this.friends);
}
