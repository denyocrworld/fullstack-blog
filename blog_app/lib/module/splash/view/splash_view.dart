import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/splash_controller.dart';

class SplashView extends StatefulWidget {
  SplashView({Key? key}) : super(key: key);

  Widget build(context, SplashController controller) {
    controller.view = this;

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "DN",
              style: GoogleFonts.alice(
                fontSize: 120.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Write less do more",
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ).animate().fadeIn(
            duration: 2000.ms,
          ),
    );
  }

  @override
  State<SplashView> createState() => SplashController();
}
