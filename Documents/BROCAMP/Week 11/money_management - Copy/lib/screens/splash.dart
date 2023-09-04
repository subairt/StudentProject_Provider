import 'package:flutter/material.dart';
import 'package:money_management/main.dart';
import 'package:money_management/screens/onboarding/first_screen.dart';
import 'package:money_management/widgets/bottomnavigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    gotoLogin();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            'assets/images/iconmoneymanager.png',
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> gotoLogin() async {
    await Future.delayed(
      const Duration(seconds: 4),
    );
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => const FirstScreen()),);
  }

  Future<void> checkUserLoggedIn() async {
    final sharedPref = await SharedPreferences.getInstance();
    final userLoggedIn = sharedPref.getBool(saveKeyName);
    if (userLoggedIn == null || userLoggedIn == false) {
      gotoLogin();
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx1) => const BottomNavBar()));
    }
  }
}
