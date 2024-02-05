import 'package:flutter/material.dart';
import 'package:stradmon_chairs/constants/app_defaults.dart';
import 'package:stradmon_chairs/constants/app_strings.dart';
import 'package:stradmon_chairs/constants/custom_text.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/cart.png",
            height: 200,
            width: 200,
            fit: BoxFit.cover,
          ),
          AppDefaults.gapM,
          TextCustom.h2(
            StringsGeneric.emptyFavorites.toUpperCase(),
          ),
        ],
      ),
    );
  }
}
