import 'package:stradmon_chairs/model/shirt.dart';

abstract class FavoritesEvent {}

class AddFavoritesEvent extends FavoritesEvent {
  AddFavoritesEvent({required this.shirt});

  Shirt shirt;
}

class RemoveFavoritesEvent extends FavoritesEvent {
  RemoveFavoritesEvent({required this.shirt});

  Shirt shirt;
}
