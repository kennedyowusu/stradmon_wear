import 'package:flutter/material.dart';
import 'package:stradmon_chairs/constants/app_colors.dart';
import 'package:stradmon_chairs/constants/app_defaults.dart';

class BorderContainer extends StatelessWidget {
  const BorderContainer({
    required this.child,
    super.key,
    this.color = AppColors.blackColor,
    this.size = 60.0,
  });

  final Widget child;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDefaults.padding - 13),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          AppDefaults.padding,
        ),
        child: Container(
          height: size,
          width: size,
          color: color.withOpacity(0.5),
          child: Center(child: child),
        ),
      ),
    );
  }
}
