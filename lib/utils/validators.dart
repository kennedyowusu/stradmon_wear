import 'package:form_field_validator/form_field_validator.dart';

class Validators {
  static final email = EmailValidator(errorText: 'Enter a valid email address');

  static final password = MultiValidator(
    [
      RequiredValidator(errorText: 'Password is required'),
      MinLengthValidator(8,
          errorText: 'Password must be at least 8 digits long'),
      PatternValidator(r'(?=.*?[#?!@$%^&*-])',
          errorText: 'Passwords must have at least one special character')
    ],
  );

  static RequiredValidator requiredWithFieldName(String? fieldName) =>
      RequiredValidator(errorText: '${fieldName ?? 'Field'} is required');

  static final required = RequiredValidator(errorText: 'Field is required');
}
