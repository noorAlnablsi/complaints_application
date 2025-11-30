// lib/service/auth_service.dart
import 'package:complaints_application/main.dart';
import 'package:complaints_application/model/AuthModel/login_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final Dio dio = Dio();

  Future<bool> login({required LoginModel loginInfo}) async {
    try {
      Response response = await dio.post(
        '$baseUrl/api/auth/login',
        data: loginInfo.toMap(),
        options: Options(
          headers: {
            'accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        final data = response.data['data'];
        final user = data['user'];
        String token = data['token'];

        // تخزين التوكن وبيانات المستخدم
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('access_token', token);
        await prefs.setInt('user_id', user['id']);
        await prefs.setString('name', user['name']);
        await prefs.setString('identifier', user['identifier']);
        await prefs.setString('role', user['role']);

        print("Login successful: $token");
        return true;
      } else {
        print("Login failed: ${response.data}");
        return false;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print("Error: ${e.response?.statusCode} - ${e.response?.data}");
      } else {
        print("Error: ${e.message}");
      }
      return false;
    }
  }
}
