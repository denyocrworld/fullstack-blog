import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/profile_controller.dart';

class ProfileView extends StatefulWidget {
  ProfileView({Key? key}) : super(key: key);

  Widget build(context, ProfileController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 64.0,
              backgroundColor: Colors.white,
              child: Text(
                "${AuthService.currentUser!["name"][0]}",
                style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              "${AuthService.currentUser!["name"]}",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${AuthService.currentUser!["email"]}",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
            Spacer(),
            QButton(
              label: "Logout",
              color: Colors.red,
              onPressed: () => controller.doLogout(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<ProfileView> createState() => ProfileController();
}
