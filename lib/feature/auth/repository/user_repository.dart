import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_boilerplate/feature/auth/model/login_response.dart';
import 'package:flutter_boilerplate/shared/constants/store_key.dart';
import 'package:flutter_boilerplate/shared/util/platform_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserRepositoryProtocol {
  Future<void> remove();

  Future<void> saveToken(LoginResponse token);

  Future<LoginResponse?> fetchToken();
}

final tokenRepositoryProvider = Provider(UserRepository.new);

class UserRepository implements UserRepositoryProtocol {
  UserRepository(this._ref);

  late final PlatformType _platform = _ref.read(platformTypeProvider);
  final Ref _ref;
  LoginResponse? _user;

  @override
  Future<void> remove() async {
    _user = null;
    final prefs = await SharedPreferences.getInstance();

    if (_platform == PlatformType.iOS ||
        _platform == PlatformType.android ||
        _platform == PlatformType.linux) {
      const storage = FlutterSecureStorage();
      try {
        await storage.delete(key: StoreKey.user.toString());
      } on Exception catch (e) {
        if (kDebugMode) {
          print('error : $e');
        }
      }
    } else {
      await prefs.remove(StoreKey.user.toString());
    }
  }

  @override
  Future<void> saveToken(LoginResponse user) async {
    final prefs = await SharedPreferences.getInstance();
    _user = user;
    if (_platform == PlatformType.iOS ||
        _platform == PlatformType.android ||
        _platform == PlatformType.linux) {
      const storage = FlutterSecureStorage();
      try {
        await storage.write(
          key: StoreKey.user.toString(),
          value: jsonEncode(user.toJson()),
        );
      } on Exception catch (e) {
        if (kDebugMode) {
          print('error : $e');
        }
      }
    } else {
      await prefs.setString(
        StoreKey.user.toString(),
        jsonEncode(user.toJson()),
      );
    }
  }

  @override
  Future<LoginResponse?> fetchToken() async {
    // if (_token != null) {
    //   return _token;
    // }

    String? userValue;

    if (_platform == PlatformType.iOS ||
        _platform == PlatformType.android ||
        _platform == PlatformType.linux) {
      const storage = FlutterSecureStorage();
      userValue = await storage.read(key: StoreKey.user.toString());
    } else {
      final prefs = await SharedPreferences.getInstance();
      userValue = prefs.getString(StoreKey.user.toString());
    }
    try {
      if (userValue != null) {
        _user = LoginResponse.fromJson(
          json.decode(userValue) as Map<String, dynamic>,
        );
      }
    } on Exception {
      return _user;
    }

    return _user;
  }
}
