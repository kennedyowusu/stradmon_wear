import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stradmon_chairs/bloc/product_bloc.dart';
import 'package:stradmon_chairs/bloc/product_events.dart';
import 'package:stradmon_chairs/bloc/product_state.dart';
import 'package:stradmon_chairs/constants/app_colors.dart';
import 'package:stradmon_chairs/constants/app_defaults.dart';
import 'package:stradmon_chairs/constants/app_fonts.dart';
import 'package:stradmon_chairs/constants/app_strings.dart';
import 'package:stradmon_chairs/constants/custom_text.dart';
import 'package:stradmon_chairs/model/product.dart';
import 'package:stradmon_chairs/model/shirt.dart';
import 'package:stradmon_chairs/repositories/shirt_repository.dart';
import 'package:stradmon_chairs/routes/on_generate_route.dart';
import 'package:stradmon_chairs/utils/price.dart';
import 'package:stradmon_chairs/widgets/border.dart';
import 'package:stradmon_chairs/widgets/fav_button.dart';

class DetailView extends StatefulWidget {
  const DetailView({
    required this.shirtId,
    super.key,
  });

  final String shirtId;

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  final String _selectedSize = StringsGeneric.medium;
  final double _valueSize = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Shirt shirt =
        shirts.firstWhere((shirt) => shirt.id.toString() == widget.shirtId);
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            topSection(size, shirt, context),
            middleSection(shirt),
            const Spacer(),
            bottom(shirt, size),
          ],
        ),
      ),
    );
  }

  SizedBox topSection(
    Size size,
    Shirt itemShirt,
    BuildContext context,
  ) {
    return SizedBox(
      height: size.height * 0.60,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(AppDefaults.padding * 2),
                bottomRight: Radius.circular(AppDefaults.padding * 2),
              ),
              child: SizedBox(
                height: size.height * 0.60,
                width: size.width,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Image.asset(itemShirt.imageAssets),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppDefaults.padding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => context.pop(context),
                  child: const BorderContainer(
                    child: Icon(
                      Icons.chevron_left,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await GoRouter.of(context).push(RoutesGeneric.cartRoute);
                  },
                  child: Stack(
                    children: [
                      const BorderContainer(
                        child: Icon(
                          Icons.shopping_bag,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: BlocBuilder<ProductBloc, ProductState>(
                          builder: (context, state) {
                            if (state is ProductInitialState) {
                              return Container();
                            } else if (state is ProductSuccessState) {
                              return SizedBox(
                                height: 30,
                                width: 30,
                                child: BorderContainer(
                                  child: TextCustom.body(
                                    color: AppColors.whiteColor,
                                    state.products.length.toString(),
                                  ),
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 10,
            left: 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                AppDefaults.padding * 0.2,
              ),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(0, 0, 0, 1).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(
                    AppDefaults.padding * 0.5,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDefaults.padding * 1,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        itemShirt.name,
                        style: const TextStyle(
                          fontFamily: AppFonts.poppins,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          height: 1.5,
                          color: AppColors.whiteColor,
                        ),
                        maxLines: 1,
                        textAlign: TextAlign.start,
                      ),
                      FavoritesButton(itemShirt: itemShirt),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding middleSection(Shirt itemShirt) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppDefaults.padding * 2,
        right: AppDefaults.padding * 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppDefaults.gapM,
          TextCustom.h1(StringsGeneric.description),
          AppDefaults.gapM,
          Text(
            itemShirt.description,
            style: TextStyle(
              fontFamily: AppFonts.inter,
              fontSize: 15,
              fontWeight: FontWeight.w400,
              height: 1.4,
              color: Colors.black.withOpacity(0.7),
            ),
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }

  Column bottom(Shirt shirt, Size size) {
    void addToCart(Product product) {
      context.read<ProductBloc>().add(AddProductEvent(product: product));
    }

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.blackColor.withOpacity(0.1),
          ),
          height: size.height * 0.08,
          child: Padding(
            padding: const EdgeInsets.all(AppDefaults.padding - 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextCustom.h1(
                      formattedPrice(
                        finalDiscount(shirt) * _valueSize,
                      ),
                    ),
                    if (finalDiscount(shirt) != shirt.price)
                      TextCustom.discount(
                        formattedPrice(shirt.price * _valueSize),
                      )
                    else
                      Container(),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: const Size(200, 50),
                  ),
                  onPressed: () {
                    addToCart(
                      Product(
                        shirt: Shirt(
                          id: shirt.id,
                          name: shirt.name,
                          intensity: shirt.intensity,
                          shirtType: shirt.shirtType,
                          price: shirt.price * _valueSize,
                          isActive: shirt.isActive,
                          bestSellers: shirt.bestSellers,
                          imageAssets: shirt.imageAssets,
                          description: shirt.description,
                          rating: shirt.rating,
                        ),
                        size: _selectedSize,
                      ),
                    );
                  },
                  child: TextCustom.h4(
                    StringsGeneric.addCart,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
