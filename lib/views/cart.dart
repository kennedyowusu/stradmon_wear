import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:stradmon_chairs/bloc/product_bloc.dart';
import 'package:stradmon_chairs/bloc/product_state.dart';
import 'package:stradmon_chairs/constants/app_colors.dart';
import 'package:stradmon_chairs/constants/app_defaults.dart';
import 'package:stradmon_chairs/constants/app_icons.dart';
import 'package:stradmon_chairs/constants/app_strings.dart';
import 'package:stradmon_chairs/constants/custom_text.dart';
import 'package:stradmon_chairs/routes/on_generate_route.dart';
import 'package:stradmon_chairs/utils/price.dart';
import 'package:stradmon_chairs/widgets/empty.dart';
import 'package:stradmon_chairs/widgets/item_cart.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildItemCart(),
          _buildPayment(size),
        ],
      ),
    );
  }

  Expanded _buildItemCart() {
    return Expanded(
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          final productsList = state.products;
          if (state is ProductSuccessState && productsList.isNotEmpty) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(AppDefaults.padding * 2),
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: productsList.length,
                  itemBuilder: (context, index) {
                    return ItemCart(
                      itemProduct: productsList[index],
                    );
                  },
                ),
              ),
            );
          }
          return const EmptyWidget();
        },
      ),
    );
  }
}

ClipRRect _buildPayment(Size size) {
  return ClipRRect(
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(AppDefaults.padding * 2),
      topRight: Radius.circular(AppDefaults.padding * 2),
    ),
    child: BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state.products.isNotEmpty) {
          return Container(
            height: 160,
            color: AppColors.whiteColor,
            child: Padding(
              padding: const EdgeInsets.all(AppDefaults.padding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _valueRow(
                    StringsGeneric.subTotal,
                    formattedPrice(
                      valueProduct(state.products),
                    ),
                  ),
                  _valueRow(
                    StringsGeneric.discount,
                    formattedPrice(
                      valueProductDiscount(state.products),
                    ),
                  ),
                  _valueRow(
                    StringsGeneric.totalAmount,
                    formattedPrice(
                      valueProductFinal(state.products),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: size.width * 0.8,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.greenColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () async =>
                          GoRouter.of(context).push(RoutesGeneric.paymentRoute),
                      child: TextCustom.body3(
                        StringsGeneric.checkout,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Container();
      },
    ),
  );
}

Row _valueRow(String valueType, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      TextCustom.body3(valueType),
      if (valueType == StringsGeneric.discount)
        TextCustom.body3('- $value', color: AppColors.greenColor)
      else
        TextCustom.body3(value),
    ],
  );
}
