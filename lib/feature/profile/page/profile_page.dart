import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/feature/auth/model/login_response.dart';
import 'package:flutter_boilerplate/feature/auth/provider/auth_provider.dart';
import 'package:flutter_boilerplate/shared/constants/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'components/top_profile.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LoginResponse? user;
    user = ref.watch(authNotifierProvider).user;
    print(user);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Profile'),
          Text(user.toString()),
        ],
      ),
    );
  }
}
