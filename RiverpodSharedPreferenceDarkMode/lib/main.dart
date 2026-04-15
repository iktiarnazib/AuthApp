import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habittracker/pages/home_page.dart';
import 'package:habittracker/pages/settings_page.dart';
import 'package:habittracker/theme/theme_provider.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: currentTheme,
      home: HomePage(),
      routes: {'settingsPage': (context) => SettingsPage()},
    );
  }
}
