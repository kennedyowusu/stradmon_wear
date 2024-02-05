import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stradmon_chairs/constants/app_defaults.dart';
import 'package:stradmon_chairs/constants/app_icons.dart';
import 'package:stradmon_chairs/constants/app_strings.dart';
import 'package:stradmon_chairs/constants/custom_text.dart';
import 'package:stradmon_chairs/model/shirt.dart';
import 'package:stradmon_chairs/repositories/shirt_repository.dart';
import 'package:stradmon_chairs/widgets/item_type.dart';

class OfferView extends StatelessWidget {
  const OfferView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> typesToFind = <String>[
      StringsGeneric.lacoste,
      StringsGeneric.shirt,
    ];
    final List<Shirt> offerShirt = shirts
        .where(
          (element) =>
              element.isActive && typesToFind.contains(element.shirtType),
        )
        .toList();
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
      body: ClipRRect(
        borderRadius: BorderRadius.circular(AppDefaults.padding * 2),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: offerShirt.length,
          itemBuilder: (context, index) {
            final Shirt shirt = offerShirt[index];
            return ItemType(itemShirt: shirt);
          },
        ),
      ),
    );
  }
}
