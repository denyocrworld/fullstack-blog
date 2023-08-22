import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/splash_view.dart';

class SplashController extends State<SplashView> {
  static late SplashController instance;
  late SplashView view;

  @override
  void initState() {
    instance = this;
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardView()),
      );
    });
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
