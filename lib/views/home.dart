import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stradmon_chairs/constants/app_colors.dart';
import 'package:stradmon_chairs/constants/app_defaults.dart';
import 'package:stradmon_chairs/constants/app_icons.dart';
import 'package:stradmon_chairs/constants/app_images.dart';
import 'package:stradmon_chairs/constants/app_strings.dart';
import 'package:stradmon_chairs/constants/custom_text.dart';
import 'package:stradmon_chairs/model/shirt.dart';
import 'package:stradmon_chairs/repositories/shirt_repository.dart';
import 'package:stradmon_chairs/widgets/category.dart';
import 'package:stradmon_chairs/widgets/product_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Shirt> activeShirts =
        shirts.where((element) => element.isActive).toList();
    return SafeArea(
      child: Scaffold(
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            topSection(context),
            trendingWear(context, activeShirts),
            CategoryBasedItem(activeShirts: activeShirts),
          ],
        ),
      ),
    );
  }

  Container topSection(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.blackColor,
        borderRadius: BorderRadius.circular(AppDefaults.padding),
      ),
      height: size.height * 0.18,
      width: size.width - 20,
      child: Stack(
        children: [
          Positioned(
            top: 30,
            left: 20,
            child: SizedBox(
              height: 120,
              width: size.width * 0.70,
              child: TextCustom.top(
                StringsGeneric.phrase,
                color: AppColors.whiteColor,
              ),
            ),
          ),
          Positioned(
            top: 85,
            left: 20,
            child: Container(
              width: 150,
              height: 35,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(AppDefaults.padding - 7),
              ),
              child: Center(
                child: TextCustom.body3(
                  StringsGeneric.discount,
                ),
              ),
            ),
          ),
          Positioned(
            right: -10,
            bottom: -10,
            child: SizedBox(
              height: 120,
              width: size.width * 0.3,
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Image.asset(AppImages.whiteShirt),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Column trendingWear(
  BuildContext context,
  List<Shirt> items,
) {
  final Size size = MediaQuery.of(context).size;
  final List<Shirt> trendingShirts =
      items.where((element) => element.bestSellers).toList();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      AppDefaults.gap,
      Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: TextCustom.body4(StringsGeneric.trends),
      ),
      AppDefaults.gapM,
      SizedBox(
        height: size.height * 0.27,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: trendingShirts.length,
          itemBuilder: (context, index) {
            final Shirt shirt = trendingShirts[index];
            return TrendingShirt(itemShirt: shirt);
          },
        ),
      ),
    ],
  );
}
