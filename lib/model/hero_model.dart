class HeroModel {
  final String name;
  final String description;
  final String imageUrl;

  HeroModel(this.name, this.description, this.imageUrl);

  factory HeroModel.fromMap(Map<String, dynamic> parsedJson) {
    return HeroModel(
      parsedJson['name'] ?? '',
      parsedJson['description'] ?? '',
      parsedJson['thumbnail']['path'] ?? '',
    );
  }

}
