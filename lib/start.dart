import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/app.dart';
import 'package:flutter_boilerplate/shared/util/logger.dart';
import 'package:flutter_boilerplate/shared/util/platform_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> start() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  final platformType = detectPlatformType();

  runApp(
    ProviderScope(
      overrides: [
        platformTypeProvider.overrideWithValue(platformType),
      ],
      observers: [Logger()],
      child: const App(),
    ),
  );
}
