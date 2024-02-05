import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stradmon_chairs/bloc/favorites_bloc.dart';
import 'package:stradmon_chairs/bloc/favorites_events.dart';
import 'package:stradmon_chairs/bloc/favorites_state.dart';
import 'package:stradmon_chairs/constants/app_colors.dart';
import 'package:stradmon_chairs/constants/app_strings.dart';
import 'package:stradmon_chairs/model/shirt.dart';
import 'package:stradmon_chairs/widgets/snack_bar.dart';

class FavoritesButton extends StatefulWidget {
  const FavoritesButton({
    required this.itemShirt,
    super.key,
  });
  final Shirt itemShirt;

  @override
  State<FavoritesButton> createState() => _FavoritesButtonState();
}

class _FavoritesButtonState extends State<FavoritesButton> {
  void _addFavorites(Shirt shirt) {
    context.read<FavoritesBloc>().add(
          AddFavoritesEvent(shirt: shirt),
        );
  }

  void _removeFavorites(Shirt shirt) {
    context.read<FavoritesBloc>().add(
          RemoveFavoritesEvent(shirt: shirt),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        final isFavorite = (state is FavoritesSuccessState) &&
            state.shirt.contains(widget.itemShirt);
        return IconButton(
          onPressed: () async {
            if (isFavorite) {
              _removeFavorites(widget.itemShirt);
              ScaffoldMessenger.of(context).showSnackBar(
                showSnack(StringsGeneric.removeFavorites),
              );
            } else {
              _addFavorites(widget.itemShirt);
              ScaffoldMessenger.of(context).showSnackBar(
                showSnack(StringsGeneric.addFavorites),
              );
            }
          },
          icon: Icon(
            color: isFavorite ? Colors.red : AppColors.whiteColor,
            size: 30,
            isFavorite ? Icons.favorite : Icons.favorite_border,
          ),
        );
      },
    );
  }
}
