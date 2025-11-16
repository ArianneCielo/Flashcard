import 'package:flutter/material.dart';
import 'package:aiskolar_app/splash.dart';
import 'package:aiskolar_app/landing.dart';
import 'package:aiskolar_app/auth/signup.dart';
import 'package:aiskolar_app/auth/login.dart';
import 'package:aiskolar_app/auth/update_info.dart';
import 'package:aiskolar_app/home/home.dart';
import 'package:aiskolar_app/profile/profile.dart';
import 'package:aiskolar_app/scholarship/details.dart';
import 'package:aiskolar_app/scholarship/requirements.dart';
import 'package:aiskolar_app/application/form.dart';
import 'package:aiskolar_app/application/upload_docs.dart';

final supabase = Supabase.instance.client;

class AiskolarApp extends StatelessWidget {
  const AiskolarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI SKOLAR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff022760),
          primary: const Color(0xff022760),
          secondary: const Color(0xffFFD047),
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashScreen(),
        '/landing': (_) => const LandingPage(),
        '/signup': (_) => const SignUpPage(),
        '/login': (_) => const LoginPage(),
        '/update-info': (_) => const UpdateInfoPage(),
        '/home': (_) => const HomePage(),
        '/profile': (_) => const ProfilePage(),
        '/scholarship-details': (_) => const ScholarshipDetailsPage(),
        '/scholarship-requirements': (_) => const ScholarshipRequirementsPage(),
        '/application-form': (_) => const ApplicationFormPage(),
        '/upload-docs': (_) => const UploadDocsPage(),
      },
    );
  }
}
