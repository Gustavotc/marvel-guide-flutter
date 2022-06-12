import 'package:marvel_guide/model/favorite_model.dart';

class FavoritesStore {
  FavoriteModel? favorites;

  FavoritesStore._constructor();

  static final FavoritesStore _instance = FavoritesStore._constructor();

  static FavoritesStore get instance => _instance;
}
