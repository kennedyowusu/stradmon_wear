import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stradmon_chairs/bloc/favorites_bloc.dart';
import 'package:stradmon_chairs/bloc/favorites_state.dart';
import 'package:stradmon_chairs/constants/app_defaults.dart';
import 'package:stradmon_chairs/constants/app_icons.dart';
import 'package:stradmon_chairs/constants/app_strings.dart';
import 'package:stradmon_chairs/constants/custom_text.dart';
import 'package:stradmon_chairs/model/shirt.dart';
import 'package:stradmon_chairs/widgets/empty.dart';
import 'package:stradmon_chairs/widgets/fav_button.dart';
import 'package:stradmon_chairs/widgets/item_type.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextCustom.h1(StringsGeneric.appName),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Center(
            child: SvgPicture.asset(AppIcons.sidebarIcon),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8, top: 4, bottom: 4),
            child: SvgPicture.asset(AppIcons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<FavoritesBloc, FavoritesState>(
              builder: (context, state) {
                final List<Shirt> favoritesList = state.shirt;
                if (state is FavoritesSuccessState && state.shirt.isNotEmpty) {
                  return ClipRRect(
                    borderRadius:
                        BorderRadius.circular(AppDefaults.padding * 2),
                    child: SizedBox(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: favoritesList.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              ItemType(
                                itemShirt: favoritesList[index],
                              ),
                              Positioned(
                                right: 10,
                                bottom: 10,
                                child: FavoritesButton(
                                  itemShirt: favoritesList[index],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  );
                }
                return const EmptyWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}
