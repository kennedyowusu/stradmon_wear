import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stradmon_chairs/routes/on_generate_route.dart';
import '../../constants/constants.dart';

class UnknownPage extends StatelessWidget {
  const UnknownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Padding(
          padding: const EdgeInsets.all(AppDefaults.padding),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                'Screen Not Found'.toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.all(AppDefaults.padding),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 5,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(AppDefaults.radius * 2),
                      bottomRight: Radius.circular(AppDefaults.radius * 2),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: const AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Image(
                      image: AssetImage(
                        AppImages.unknown,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppDefaults.padding),
                child: Column(
                  children: [
                    Text(
                      'oops!! something went wrong'.toUpperCase(),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: AppDefaults.padding),
                      child: Text(
                        'Something went wrong\nplease try again .',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppDefaults.padding * 2),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).push(RoutesGeneric.entryRoute);
                    },
                    child: const Text(
                      'Try Again',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
