import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stradmon_chairs/constants/app_colors.dart';
import 'package:stradmon_chairs/constants/app_defaults.dart';
import 'package:stradmon_chairs/constants/custom_text.dart';
import 'package:stradmon_chairs/model/shirt.dart';
import 'package:stradmon_chairs/routes/on_generate_route.dart';
import 'package:stradmon_chairs/utils/price.dart';
import 'package:stradmon_chairs/widgets/image_container.dart';

class ItemType extends StatelessWidget {
  const ItemType({
    required this.itemShirt,
    super.key,
  });

  final Shirt itemShirt;

  @override
  Widget build(BuildContext context) {
    final String price = finalPrice(itemShirt);
    final String discountMessage = textDiscount(itemShirt);

    return GestureDetector(
      onTap: () async => GoRouter.of(context)
          .push('${RoutesGeneric.productDetailRoute}${itemShirt.id}'),
      child: Padding(
        padding: const EdgeInsets.all(AppDefaults.padding - 7),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppDefaults.padding),
          child: Container(
            height: 150,
            color: AppColors.whiteColor,
            child: Padding(
              padding: const EdgeInsets.all(AppDefaults.padding - 9),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShirtImageContainer(
                    itemShirt: itemShirt,
                    height: 145,
                    width: 130,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppDefaults.padding - 9),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextCustom.h4(itemShirt.name),
                        TextCustom.description(itemShirt.shirtType),
                        Row(
                          children: [
                            TextCustom.h2(price, color: AppColors.primary),
                            AppDefaults.gapM,
                            TextCustom.sale(discountMessage),
                            AppDefaults.gapM,
                            TextCustom.discount(
                              valueDiscount(itemShirt),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 30,
                            ),
                            TextCustom.h4(
                              itemShirt.rating.toString(),
                            ),
                          ],
                        ),
                      ],
                    ),
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
