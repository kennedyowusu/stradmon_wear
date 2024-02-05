import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:stradmon_chairs/constants/app_colors.dart';
import 'package:stradmon_chairs/constants/app_defaults.dart';
import 'package:stradmon_chairs/constants/app_icons.dart';
import 'package:stradmon_chairs/routes/on_generate_route.dart';
import 'package:stradmon_chairs/themes/app_themes.dart';
import 'package:stradmon_chairs/utils/validators.dart';
import 'auth_button.dart';

class LoginViewForm extends StatefulWidget {
  const LoginViewForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginViewForm> createState() => _LoginViewFormState();
}

class _LoginViewFormState extends State<LoginViewForm> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  bool togglePassword = false;

  onPassToggled() {
    togglePassword = !togglePassword;
    setState(() {});
  }

  onLoginSuccess() {
    final bool isFormOkay = _key.currentState?.validate() ?? false;
    if (isFormOkay) {
      GoRouter.of(context).push(RoutesGeneric.entryRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.defaultTheme.copyWith(
        inputDecorationTheme: AppTheme.secondaryInputDecorationTheme,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppDefaults.padding),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Phone Number"),
              const SizedBox(height: 8),
              TextFormField(
                keyboardType: TextInputType.number,
                validator: Validators.requiredWithFieldName('Phone'),
                textInputAction: TextInputAction.next,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              const SizedBox(height: AppDefaults.padding),
              const Text("Password"),
              const SizedBox(height: 8),
              TextFormField(
                validator: Validators.password,
                onFieldSubmitted: (v) => onLoginSuccess(),
                textInputAction: TextInputAction.done,
                obscureText: !togglePassword,
                decoration: InputDecoration(
                  suffixIcon: Material(
                    color: Colors.transparent,
                    child: IconButton(
                      onPressed: onPassToggled,
                      icon: SvgPicture.asset(
                        AppIcons.eye,
                        width: 24,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    GoRouter.of(context)
                        .push(RoutesGeneric.forgotPasswordRoute);
                  },
                  child: const Text(
                    'Forget Password?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              AuthButton(
                onPressed: onLoginSuccess,
                title: "Login",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
