class FavoriteModel {
  final List<int>? heroes;
  final List<int>? comics;

  FavoriteModel({
    this.heroes,
    this.comics,
  });

  // factory FavoriteModel.fromMap(Map<String, dynamic> parsedJson) {
  //   return FavoriteModel(
  //     heroes: parsedJson['heroes'] ?? [],
  //     comics: parsedJson['comics'] ?? [],
  //   );
  // }

  Map<String, dynamic> toMap() {
    return {
      'heroes': heroes,
      'comics': comics,
    };
  }

  factory FavoriteModel.fromMap(Map<String, dynamic> map) {
    return FavoriteModel(
      heroes: List<int>.from(map['heroes'] ?? []),
      comics: List<int>.from(map['comics'] ?? []),
    );
  }
}
