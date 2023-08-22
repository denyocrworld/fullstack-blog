import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/login_controller.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        actions: [],
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "DN",
              style: GoogleFonts.alice(
                fontSize: 64.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Write less do more",
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            QTextField(
              label: "Email",
              validator: Validator.email,
              suffixIcon: Icons.email,
              onChanged: (value) {
                controller.email = value;
              },
            ),
            QTextField(
              label: "Password",
              obscure: true,
              validator: Validator.required,
              suffixIcon: Icons.password,
              onChanged: (value) {
                controller.password = value;
              },
            ),
            QButton(
              label: "Login",
              onPressed: () => controller.doLogin(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<LoginView> createState() => LoginController();
}
