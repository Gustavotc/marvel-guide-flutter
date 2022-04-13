class ComicModel {
  final String title;
  final String imageUrl;

  ComicModel(this.title, this.imageUrl);

  factory ComicModel.fromMap(Map<String, dynamic> parsedJson) {
    return ComicModel(
      parsedJson['title'] ?? '',
      parsedJson['thumbnail']['path'] ?? '',
    );
  }
}
