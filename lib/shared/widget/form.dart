import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/util/validator.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    required this.name,
    required this.labelText,
    this.isPassword = false,
    this.isEmail = false,
    this.isRequired = true,
    super.key,
  });
  final String name;
  final String labelText;
  final bool isPassword;
  final bool isEmail;
  final bool isRequired;
  @override
  Widget build(BuildContext context) {
    var isObscure = false;
    return StatefulBuilder(
      builder: (context, setState) {
        return FormBuilderTextField(
          name: name,
          decoration: InputDecoration(
            labelText: labelText,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            suffixIcon: !isPassword
                ? null
                : IconButton(
                    splashRadius: 9,
                    icon: Icon(
                      isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                  ),
          ),
          obscureText: isObscure,
          validator: FormBuilderValidators.compose([
            if (isRequired) FormBuilderValidators.required(),
            if (isEmail) FormBuilderValidators.email(),
            if (isPassword)
              (val) {
                final password = val;
                if (password == null) return null;
                if (!Validator.isValidPassWord(password)) {
                  return 'Minimum 8 characters required';
                }
                return null;
              },
          ]),
        );
      },
    );
  }
}
