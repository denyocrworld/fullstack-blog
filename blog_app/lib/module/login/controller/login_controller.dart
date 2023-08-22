import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/service/auth_service/auth_service.dart';
import '../view/login_view.dart';

class LoginController extends State<LoginView> {
  static late LoginController instance;
  late LoginView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String email = "";
  String password = "";
  doLogin() async {
    try {
      bool isSuccess = await AuthService().login(
        email: email,
        password: password,
      );

      if (!isSuccess) {
        showInfoDialog("Wrong email or password!");
        return;
      }

      Get.offAll(DashboardView());
    } on Exception catch (err) {
      showInfoDialog("Wrong email or password!");
    }
  }
}
