import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _redirect();
  }

  Future<void> _redirect() async {
    await Future.delayed(const Duration(seconds: 2));
    final session = Supabase.instance.client.auth.currentSession;
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, session == null ? '/landing' : '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff022760),
      body: Center(
        child: Text(
          'AI SKOLAR',
          style: TextStyle(
              color: const Color(0xffFFD047),
              fontSize: 40,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
