import 'package:stradmon_chairs/model/shirt.dart';

abstract class FavoritesState {
  FavoritesState({required this.shirt});
  List<Shirt> shirt;
}

class FavoritesInitialState extends FavoritesState {
  FavoritesInitialState() : super(shirt: []);
}

class FavoritesSuccessState extends FavoritesState {
  FavoritesSuccessState({required super.shirt});
}
