import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stradmon_chairs/bloc/favorites_events.dart';
import 'package:stradmon_chairs/bloc/favorites_state.dart';
import 'package:stradmon_chairs/repositories/favorites_repository.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesInitialState()) {
    final favoritesRepo = FavoritesRepository();
    on<AddFavoritesEvent>(
      (event, emit) => emit(
        FavoritesSuccessState(
          shirt: favoritesRepo.addFavorites(event.shirt),
        ),
      ),
    );

    on<RemoveFavoritesEvent>(
      (event, emit) => emit(
        FavoritesSuccessState(
          shirt: favoritesRepo.removeFavorites(event.shirt),
        ),
      ),
    );
  }
}
