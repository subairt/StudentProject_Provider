import 'package:flutter/material.dart';
import 'package:money_management/screens/settings_screens/about.dart';
import 'package:money_management/screens/settings_screens/privacypolicy.dart';
import 'package:money_management/screens/settings_screens/termsandconditions.dart';
import 'package:money_management/widgets/app_bar.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenHeight = size.height;
    final double textSize = size.width * 0.05;
    return SafeArea(
      child: Scaffold(
        appBar: appbar('Settings', false),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    const Icon(
                      Icons.warning,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Change Limit',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: textSize,
                          color: const Color.fromARGB(255, 11, 11, 11)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const About()));
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.info_outline,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      'About',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: textSize,
                          color: const Color.fromARGB(255, 11, 11, 11)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    const Icon(
                      Icons.restore,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Reset',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: textSize,
                        color: const Color.fromARGB(255, 11, 11, 11),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    const Icon(
                      Icons.share,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Share',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: textSize,
                          color: const Color.fromARGB(255, 11, 11, 11)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Terms()));
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.document_scanner_outlined,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Terms&Conditions',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: textSize,
                          color: const Color.fromARGB(255, 11, 11, 11)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PrivacyPolicy()));
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.privacy_tip_outlined,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Privacy Policy',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: textSize,
                          color: const Color.fromARGB(255, 11, 11, 11)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
