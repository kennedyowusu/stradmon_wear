import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:stradmon_chairs/bloc/product_bloc.dart';
import 'package:stradmon_chairs/bloc/product_events.dart';
import 'package:stradmon_chairs/constants/app_colors.dart';
import 'package:stradmon_chairs/constants/app_defaults.dart';
import 'package:stradmon_chairs/constants/app_icons.dart';
import 'package:stradmon_chairs/constants/app_strings.dart';
import 'package:stradmon_chairs/constants/custom_text.dart';
import 'package:stradmon_chairs/routes/on_generate_route.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      AppIcons.successIcon,
                      fit: BoxFit.contain,
                      width: 80,
                      height: 80,
                    ),
                  ),
                  AppDefaults.gap,
                  TextCustom.h1(StringsGeneric.paymentSuccessful),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppDefaults.padding * 2),
              child: ElevatedButton(
                onPressed: () {
                  context.read<ProductBloc>().add(CleanListProductEvent());
                  GoRouter.of(context).go(RoutesGeneric.entryRoute);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppColors.primary),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppDefaults.padding),
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppDefaults.padding),
                  child: TextCustom.h2(
                    StringsGeneric.allOffers,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
