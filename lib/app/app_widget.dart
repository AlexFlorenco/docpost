import 'package:docpost/app/pages/home_page.dart';
import 'package:docpost/app/pages/login_page.dart';
import 'package:docpost/app/pages/preferences_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:month_year_picker/month_year_picker.dart';

import '../constants.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const LoginPage(),
        ),
        GetPage(
            name: '/home',
            page: () => const HomePage(),
            transition: Transition.circularReveal),
        GetPage(
          name: '/preferences',
          page: () => const PreferencesPage(),
        ),
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        // dialogTheme: const DialogTheme(
        // surfaceTintColor: Colors.white,
        // ),
        // primarySwatch: Colors.blue,
        // colorScheme: ColorScheme.fromSeed(
        //   primary: Colors.blue,
        //   seedColor: Colors.blue,
        // ),
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontSize: 18,
            color: textColor,
          ),
          labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        MonthYearPickerLocalizations.delegate,
      ],
      supportedLocales: [const Locale('pt', 'BR')],
    );
  }
}