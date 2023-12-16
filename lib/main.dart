import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hayaa_main/features/auth/choice%20between%20registration%20and%20login/views/choice_between_registration_and_login_view.dart';
import 'package:hayaa_main/features/auth/sinup/view/signup_view.dart';
import 'core/Utils/app_routes.dart';
import 'features/splash/views/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  runApp(EasyLocalization(supportedLocales: const [
    Locale('en', 'US'),
    Locale('ar', 'DZ'),
  ], path: 'lib/core/Utils/assets/lang', child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: appRoutes,
      initialRoute: ChoiceBetweenRegistrationAndLogin.id,
    );
  }
}
