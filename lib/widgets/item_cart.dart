import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stradmon_chairs/bloc/product_bloc.dart';
import 'package:stradmon_chairs/bloc/product_events.dart';
import 'package:stradmon_chairs/constants/app_colors.dart';
import 'package:stradmon_chairs/constants/app_defaults.dart';
import 'package:stradmon_chairs/constants/custom_text.dart';
import 'package:stradmon_chairs/model/product.dart';
import 'package:stradmon_chairs/model/shirt.dart';
import 'package:stradmon_chairs/utils/price.dart';
import 'package:stradmon_chairs/widgets/image_container.dart';

class ItemCart extends StatefulWidget {
  const ItemCart({
    required this.itemProduct,
    super.key,
  });

  final Product itemProduct;

  @override
  State<ItemCart> createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  void _removeProduct(Product product) => context.read<ProductBloc>().add(
        DecrementProductQuantityEvent(product: product),
      );
  void _addProduct(Product product) {
    context.read<ProductBloc>().add(
          IncrementProductQuantityEvent(product: product),
        );
  }

  @override
  Widget build(BuildContext context) {
    final Shirt itemShirt = widget.itemProduct.shirt;
    final String price = finalPrice(itemShirt);

    return Padding(
      padding: const EdgeInsets.all(AppDefaults.padding - 7),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDefaults.padding),
        child: Container(
          height: 120,
          width: MediaQuery.of(context).size.width,
          color: AppColors.whiteColor,
          child: Padding(
            padding: const EdgeInsets.all(AppDefaults.padding - 9),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShirtImageContainer(
                  itemShirt: itemShirt,
                  height: 115,
                  width: 110,
                ),
                AppDefaults.gap,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextCustom.h4(itemShirt.name),
                      TextCustom.h4(
                        color: AppColors.primary,
                        widget.itemProduct.size,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextCustom.h4(price),
                          _buildAddSub(),
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
    );
  }

  Padding _buildAddSub() {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDefaults.padding - 9),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDefaults.padding),
        child: ColoredBox(
          color: AppColors.background,
          child: Row(
            children: [
              IconButton(
                onPressed: () => _removeProduct(widget.itemProduct),
                icon: const Icon(Icons.remove, color: AppColors.blackColor),
              ),
              AppDefaults.gapS,
              TextCustom.h4(widget.itemProduct.quantity.toString(),
                  color: AppColors.primary),
              AppDefaults.gapS,
              IconButton(
                onPressed: () => _addProduct(widget.itemProduct),
                icon: const Icon(Icons.add, color: AppColors.blackColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
