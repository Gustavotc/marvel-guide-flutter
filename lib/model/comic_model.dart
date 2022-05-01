class ComicModel {
  final int id;
  final String title;
  final String imageUrl;
  final int? pageCount;

  ComicModel(this.id, this.title, this.imageUrl, this.pageCount);

  factory ComicModel.fromMap(Map<String, dynamic> parsedJson) {
    return ComicModel(
      parsedJson['id'] ?? 0,
      parsedJson['title'] ?? '',
      parsedJson['thumbnail']['path'] ?? '',
      parsedJson['pageCount'] ?? 0,
    );
  }
}
