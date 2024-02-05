import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stradmon_chairs/constants/app_defaults.dart';
import 'package:stradmon_chairs/routes/on_generate_route.dart';
import 'package:stradmon_chairs/widgets/auth_bottom_row.dart';
import 'package:stradmon_chairs/widgets/auth_social_buttons.dart';
import 'package:stradmon_chairs/widgets/login_form.dart';
import 'package:stradmon_chairs/widgets/login_header.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDefaults.padding * 0.4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AuthViewHeader(),
                  const LoginViewForm(),
                  const SocialAuthButton(),
                  BottomRowWidget(
                    title: "Don't have an account? ",
                    subtitle: "Sign Up",
                    onPressed: () =>
                        GoRouter.of(context).push(RoutesGeneric.signupRoute),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
