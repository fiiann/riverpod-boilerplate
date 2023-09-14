import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/feature/auth/provider/auth_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends ConsumerWidget {
  SignUpPage({super.key});
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final local = AppLocalizations.of(context)!;
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            const SizedBox(height: 150),
            Text(
              local.sign_up,
              style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: local.name,
                    ),
                    controller: _nameController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: local.email,
                    ),
                    controller: _emailController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: local.password,
                    ),
                    controller: _passwordController,
                    obscureText: true,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const SizedBox(height: 30),
                      _widgetSignUpButton(context, ref, local),
                      const SizedBox(height: 30),
                      _widgetSignInButton(context, ref, local),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _widgetSignInButton(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations local,
  ) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          context.pop();
        },
        child: Text(local.sign_in),
      ),
    );
  }

  Widget _widgetSignUpButton(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations local,
  ) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          ref.read(authNotifierProvider.notifier).signUp(
                _nameController.text,
                _emailController.text,
                _passwordController.text,
              );
        },
        child: Text(local.sign_up),
      ),
    );
  }
}
