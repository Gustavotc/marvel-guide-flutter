class HeroModel {
  final int id;
  final String name;
  final String description;
  final String imageUrl;

  HeroModel(this.id, this.name, this.description, this.imageUrl);

  factory HeroModel.fromMap(Map<String, dynamic> parsedJson) {
    return HeroModel(
      parsedJson['id'] ?? 0,
      parsedJson['name'] ?? '',
      parsedJson['description'] ?? '',
      parsedJson['thumbnail']['path'] ?? '',
    );
  }
}
