import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:stradmon_chairs/constants/app_defaults.dart';
import 'package:stradmon_chairs/constants/app_icons.dart';
import 'package:stradmon_chairs/routes/on_generate_route.dart';
import 'package:stradmon_chairs/themes/app_themes.dart';
import 'package:stradmon_chairs/utils/validators.dart';
import 'package:stradmon_chairs/widgets/auth_button.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> signupkey = GlobalKey<FormState>();

  bool togglePassword = false;

  onPassToggled() {
    togglePassword = !togglePassword;
    setState(() {});
  }

  onRegisterSuccess() {
    final bool isFormOkay = signupkey.currentState?.validate() ?? false;
    if (isFormOkay) {
      GoRouter.of(context).push(RoutesGeneric.loginRoute);
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
          key: signupkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Full Name"),
              const SizedBox(height: 8),
              TextFormField(
                validator: Validators.requiredWithFieldName('Name'),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: AppDefaults.padding),
              const Text("Phone Number"),
              const SizedBox(height: 8),
              TextFormField(
                textInputAction: TextInputAction.next,
                validator: Validators.requiredWithFieldName('Phone'),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              const SizedBox(height: AppDefaults.padding),
              const Text("Password"),
              const SizedBox(height: 8),
              TextFormField(
                validator: Validators.password,
                textInputAction: TextInputAction.next,
                obscureText: !togglePassword,
                onFieldSubmitted: (v) => onRegisterSuccess(),
                decoration: InputDecoration(
                  suffixIcon: Material(
                    color: Colors.transparent,
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AppIcons.eye,
                        width: 24,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppDefaults.padding * 2),
              AuthButton(
                onPressed: onRegisterSuccess,
                title: "Register",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
