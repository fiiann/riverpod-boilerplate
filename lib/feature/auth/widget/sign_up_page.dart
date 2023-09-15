import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/feature/auth/provider/auth_provider.dart';
import 'package:flutter_boilerplate/shared/route/app_router.dart';
import 'package:flutter_boilerplate/shared/widget/custom_text_button.dart';
import 'package:flutter_boilerplate/shared/widget/form.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpPage extends ConsumerWidget {
  SignUpPage({super.key});
  final formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final local = AppLocalizations.of(context)!;
    // final auth = ref.watch(authNotifierProvider);

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: FormBuilder(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                ),
                title(local),
                const SizedBox(height: 20),
                const CustomFormField(
                  name: 'name',
                  labelText: 'Name',
                ),
                const SizedBox(height: 10),
                const CustomFormField(
                  name: 'email',
                  labelText: 'Email',
                ),
                const SizedBox(height: 10),
                const CustomFormField(
                  name: 'password',
                  labelText: 'Password',
                  isPassword: true,
                ),
                const SizedBox(height: 30),
                CustomTextButton(
                  buttonText: local.sign_up,
                  onClick: () {
                    submitLogin(ref);
                  },
                ),
                const SizedBox(height: 30),
                CustomTextButton(
                  buttonText: local.sign_in,
                  onClick: () {
                    ref.read(routerProvider).push(SignInRoute.path);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text title(AppLocalizations local) {
    return Text(
      local.sign_up,
      style: TextStyle(
        color: Colors.grey[800],
        fontWeight: FontWeight.bold,
        fontSize: 40,
      ),
    );
  }

  void submitLogin(WidgetRef ref) {
    if (formKey.currentState != null && !formKey.currentState!.validate()) {
      return;
    }

    final name = formKey.currentState!.fields['name']?.value as String;
    final email = formKey.currentState!.fields['email']?.value as String;
    final password = formKey.currentState!.fields['password']?.value as String;
    ref.read(authNotifierProvider.notifier).signUp(
          name,
          email,
          password,
        );
  }
}
