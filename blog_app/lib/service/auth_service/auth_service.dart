import 'package:dio/dio.dart';

class AuthService {
  static String? token;
  static Map<String, dynamic>? currentUser;
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    var response = await Dio().post(
      "http://localhost:8000/api/auth/login",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: {
        "email": email,
        "password": password,
      },
    );
    Map<String, dynamic> obj = response.data["data"];
    currentUser = obj;
    token = obj["token"];
    if (response.statusCode == 200) return true;
    return false;
  }

  logout() async {
    await Dio().post(
      "http://localhost:8000/api/auth/logout",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      ),
    );
    token = null;
  }
}
