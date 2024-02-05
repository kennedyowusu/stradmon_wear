import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:stradmon_chairs/constants/app_defaults.dart';
import 'package:stradmon_chairs/constants/app_images.dart';
import 'package:stradmon_chairs/routes/on_generate_route.dart';
import 'package:stradmon_chairs/themes/app_themes.dart';
import 'package:stradmon_chairs/utils/validators.dart';
import 'package:stradmon_chairs/widgets/auth_button.dart';
import 'package:stradmon_chairs/widgets/image_container.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final GlobalKey<FormState> forgetkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Theme(
            data: AppTheme.defaultTheme.copyWith(
              inputDecorationTheme: AppTheme.secondaryInputDecorationTheme,
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppDefaults.padding),
              child: Form(
                key: forgetkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: AppDefaults.padding * 3),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: const AspectRatio(
                        aspectRatio: 1 / 1,
                        child: ImageWidget(AppImages.logo),
                      ),
                    ),
                    const SizedBox(height: AppDefaults.padding * 2),
                    Text(
                      'Reset Your Password',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: AppDefaults.padding),
                    const Text(
                      'Please enter your number. We will send a code\nto your phone to reset your password.',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppDefaults.padding * 2),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Phone Number"),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      validator: Validators.requiredWithFieldName('Phone'),
                      textInputAction: TextInputAction.next,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                    const SizedBox(height: AppDefaults.padding * 2),
                    AuthButton(
                      onPressed: () {
                        GoRouter.of(context).push(RoutesGeneric.loginRoute);
                      },
                      title: "Send Code",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
