import 'package:flutter/material.dart';
import 'package:stradmon_chairs/constants/app_defaults.dart';
import 'package:stradmon_chairs/constants/app_images.dart';
import 'package:stradmon_chairs/widgets/image_container.dart';

class AuthViewHeader extends StatelessWidget {
  const AuthViewHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: const AspectRatio(
            aspectRatio: 1 / 1,
            child: ImageWidget(AppImages.logo),
          ),
        ),
        const SizedBox(height: AppDefaults.padding),
        Text(
          'Welcome back!',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
