import 'package:flutter/material.dart';
import 'package:stradmon_chairs/model/shirt.dart';

import '../constants/app_defaults.dart';

class ImageWidget extends StatelessWidget {
  final BoxFit fit;

  const ImageWidget(
    this.src, {
    Key? key,
    this.fit = BoxFit.cover,
    this.radius = AppDefaults.radius,
    this.borderRadius,
  }) : super(key: key);

  final String src;
  final double radius;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundImage: AssetImage(src),
    );
  }
}

class ShirtImageContainer extends StatelessWidget {
  const ShirtImageContainer({
    required this.itemShirt,
    required this.height,
    required this.width,
    super.key,
  });

  final Shirt itemShirt;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDefaults.padding),
      child: SizedBox(
        height: height,
        width: width,
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Image.asset(itemShirt.imageAssets),
        ),
      ),
    );
  }
}
