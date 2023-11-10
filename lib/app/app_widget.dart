import 'package:docpost/app/controllers/auth_controller.dart';
import 'package:docpost/app/pages/home/home_page.dart';
import 'package:docpost/app/pages/login/login_page.dart';
import 'package:docpost/app/pages/preferences/preferences_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:month_year_picker/month_year_picker.dart';

import '../components/constants.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: authController.isAuthenticated(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
            return GetMaterialApp(
              initialRoute: snapshot.data! ? '/home' : '/',
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
                colorScheme: ColorScheme.fromSeed(
                  seedColor: primaryColor,
                  primary: primaryColor,
                  background: primaryColor,
                ),
                useMaterial3: true,
                textTheme: const TextTheme(
                  bodyLarge:
                      TextStyle(fontSize: 18, height: 1.1, color: textColor),
                  // bodyMedium: TextStyle(fontSize: 18, color: textColor),
                  labelLarge:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
        });
  }
}
