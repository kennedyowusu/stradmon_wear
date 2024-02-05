import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:stradmon_chairs/constants/app_colors.dart';
import 'package:stradmon_chairs/constants/app_defaults.dart';
import 'package:stradmon_chairs/constants/app_strings.dart';
import 'package:stradmon_chairs/views/cart.dart';
import 'package:stradmon_chairs/views/favorite.dart';
import 'package:stradmon_chairs/views/home.dart';
import 'package:stradmon_chairs/views/offer.dart';

class EntryView extends StatefulWidget {
  const EntryView({super.key});

  @override
  State<EntryView> createState() => _EntryViewState();
}

class _EntryViewState extends State<EntryView> {
  final currentPage = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigation(context, pageController),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          HomeView(),
          FavoriteView(),
          CartView(),
          OfferView(),
        ],
      ),
    );
  }
}

Padding _bottomNavigation(BuildContext context, PageController pageController) {
  return Padding(
    padding: const EdgeInsets.all(AppDefaults.padding - 4),
    child: ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDefaults.padding + 17),
      ),
      child: GNav(
        backgroundColor: AppColors.blackColor,
        // tabBackgroundColor: AppColors.whiteColor,
        padding: const EdgeInsets.all(AppDefaults.padding - 2),
        onTabChange: (index) async {
          await pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
        gap: 8,
        tabs: const [
          GButton(
            icon: Icons.home,
            text: StringsGeneric.home,
            iconActiveColor: AppColors.primary,
            textColor: AppColors.primary,
          ),
          GButton(
            icon: Icons.favorite,
            text: StringsGeneric.favorites,
            iconActiveColor: AppColors.primary,
            textColor: AppColors.primary,
          ),
          GButton(
            icon: Icons.shopping_bag,
            text: StringsGeneric.cart,
            iconActiveColor: AppColors.primary,
            textColor: AppColors.primary,
          ),
          GButton(
            icon: Icons.discount,
            text: StringsGeneric.offer,
            iconActiveColor: AppColors.primary,
            textColor: AppColors.primary,
          ),
        ],
      ),
    ),
  );
}
