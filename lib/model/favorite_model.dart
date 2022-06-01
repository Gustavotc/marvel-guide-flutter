class FavoriteModel {
  final int marvelId;

  FavoriteModel(this.marvelId);

  factory FavoriteModel.fromMap(Map<String, dynamic> parsedJson) {
    return FavoriteModel(parsedJson['marvelId']);
  }

  Map<String, dynamic> toMap() {
    return {
      'marvelId': marvelId,
    };
  }
}
