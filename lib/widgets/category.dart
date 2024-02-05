import 'package:flutter/material.dart';
import 'package:stradmon_chairs/constants/app_colors.dart';
import 'package:stradmon_chairs/constants/app_defaults.dart';
import 'package:stradmon_chairs/constants/app_strings.dart';
import 'package:stradmon_chairs/constants/custom_text.dart';
import 'package:stradmon_chairs/model/shirt.dart';
import 'package:stradmon_chairs/widgets/item_type.dart';

class CategoryBasedItem extends StatelessWidget {
  const CategoryBasedItem({
    required this.activeShirts,
    super.key,
  });

  final List<Shirt> activeShirts;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Expanded(
        child: Column(
          children: [
            TabBar(
              onTap: (selectedTabIndex) {},
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: AppColors.blackColor.withOpacity(0.3),
              indicatorWeight: 2,
              tabs: [
                Tab(child: TextCustom.tabText(StringsGeneric.shirt)),
                Tab(child: TextCustom.tabText(StringsGeneric.long)),
                Tab(child: TextCustom.tabText(StringsGeneric.lacoste)),
                Tab(child: TextCustom.tabText(StringsGeneric.trousers)),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _listAllShirt(StringsGeneric.shirt),
                  _listAllShirt(StringsGeneric.long),
                  _listAllShirt(StringsGeneric.lacoste),
                  _listAllShirt(StringsGeneric.trousers),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ClipRRect _listAllShirt(String type) {
    final List<Shirt> wearType =
        activeShirts.where((shirt) => shirt.shirtType == type).toList();
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDefaults.padding + 17),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: wearType.length,
        itemBuilder: (context, index) {
          final Shirt shirt = wearType[index];
          return ItemType(itemShirt: shirt);
        },
      ),
    );
  }
}
