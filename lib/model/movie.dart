class Movie {
  final String name;

  Movie(this.name);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Movie && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;
}

