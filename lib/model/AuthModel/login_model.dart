// lib/models/login_model.dart
class LoginModel {
  final String identifier; // البريد أو الهاتف
  final String password;
  final String deviceToken;

  LoginModel({
    required this.identifier,
    required this.password,
    this.deviceToken = "device_token", // قيمة افتراضية
  });

  Map<String, dynamic> toMap() {
    return {
      "identifier": identifier,
      "password": password,
      "device_token": deviceToken,
    };
  }
}
