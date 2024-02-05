import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stradmon_chairs/constants/app_colors.dart';
import 'package:stradmon_chairs/constants/app_defaults.dart';
import 'package:stradmon_chairs/constants/custom_text.dart';
import 'package:stradmon_chairs/model/shirt.dart';
import 'package:stradmon_chairs/routes/on_generate_route.dart';
import 'package:stradmon_chairs/utils/price.dart';
import 'package:stradmon_chairs/widgets/image_container.dart';

class TrendingShirt extends StatelessWidget {
  const TrendingShirt({
    required this.itemShirt,
    super.key,
  });

  final Shirt itemShirt;

  @override
  Widget build(BuildContext context) {
    final String price = finalPrice(itemShirt);
    final String discount = textDiscount(itemShirt);

    return GestureDetector(
      onTap: () async => GoRouter.of(context)
          .push('${RoutesGeneric.productDetailRoute}${itemShirt.id}'),
      child: Padding(
        padding: const EdgeInsets.all(AppDefaults.padding - 7),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppDefaults.padding),
          child: Container(
            height: 200,
            width: 130,
            color: AppColors.whiteColor,
            child: Padding(
              padding: const EdgeInsets.all(AppDefaults.padding - 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ShirtImageContainer(
                        itemShirt: itemShirt,
                        height: 115,
                        width: 130,
                      ),
                      Positioned(
                        right: 3,
                        top: 3,
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(AppDefaults.padding - 7),
                          child: Container(
                            width: 50,
                            color: AppColors.whiteColor,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.red,
                                  size: 20,
                                ),
                                TextCustom.h4(
                                  itemShirt.rating.toString(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  AppDefaults.gapM,
                  TextCustom.body(itemShirt.name),
                  AppDefaults.gapS,
                  TextCustom.description(itemShirt.shirtType),
                  AppDefaults.gapM,
                  Row(
                    children: [
                      TextCustom.body(price),
                      AppDefaults.gapM,
                      TextCustom.sale(discount),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
