import 'package:stradmon_chairs/model/shirt.dart';

class FavoritesRepository {
  final List<Shirt> _favorites = [];

  List<Shirt> addFavorites(Shirt shirt) {
    _favorites.add(shirt);
    return _favorites;
  }

  List<Shirt> removeFavorites(Shirt shirt) {
    _favorites.remove(shirt);
    return _favorites;
  }
}
