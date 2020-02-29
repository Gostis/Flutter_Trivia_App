class Genre {
  final String genre, id;

  Genre({
    this.genre,
    this.id,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return new Genre(
      genre: json['name'],
      id: json['id'].toString(),
    );
  }
}
