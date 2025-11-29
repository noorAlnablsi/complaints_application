// import 'package:complaints_application/main.dart';
// import 'package:complaints_application/model/AuthModel/register_model.dart';
// import 'package:dio/dio.dart';
// // هنط baseUrl

// class RegisterService {
//   static final Dio dio = Dio();

//   static Future<bool> register(RegisterModel user) async {
//     final url = '$baseUrl/register';

//     try {
//       final response = await dio.post(
//         url,
//         data: user.toJson(),
//         options: Options(
//           headers: {
//             'accept': 'application/json',
//             'Content-Type': 'application/json',
//           },
//         ),
//       );

//       if (response.statusCode == 200 && response.data['success'] == true) {
//         print("تم التسجيل بنجاح: ${response.data}");
//         return true;
//       } else {
//         print("فشل التسجيل: ${response.data}");
//         return false;
//       }
//     } catch (e) {
//       print("خطأ أثناء التسجيل: $e");
//       return false;
//     }
//   }

//   // إرسال OTP
//   static Future<bool> sendOtp(String contact) async {
//     final url = '$baseUrl/send-otp';
//     try {
//       final response = await dio.post(url, data: {"identifier": contact});
//       if (response.statusCode == 200 && response.data['success'] == true) {
//         print("تم إرسال OTP: ${response.data}");
//         return true;
//       }
//       return false;
//     } catch (e) {
//       print("خطأ أثناء إرسال OTP: $e");
//       return false;
//     }
//   }
// }

import 'package:complaints_application/main.dart';
import 'package:dio/dio.dart';


class RegisterService {
  static final Dio dio = Dio();

  static Future<bool> register({
    required String name,
    required String nationalId,
    required String contact,
    required String password,
    required String roleId,
  }) async {
    final url = '$baseUrl/api/auth/register'; // عدّل هنا

    final data = {
      "name": name,
      "national_id": nationalId,
      "identifier": contact,
      "password": password,
      "role_id": roleId,
    };

    try {
      final response = await dio.post(
        url,
        data: data,
        options: Options(
          headers: {
            'accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        print("تم التسجيل بنجاح: ${response.data}");
        return true;
      } else {
        print("فشل التسجيل: ${response.data}");
        return false;
      }
    }catch (e) {
  if (e is DioException) {
    if (e.response != null) {
      // طباعة كامل التفاصيل اللي جاية من السيرفر
      print("خطأ أثناء التسجيل: ${e.response?.statusCode} - ${e.response?.data}");
    } else {
      print("خطأ أثناء التسجيل بدون رد من السيرفر: $e");
    }
  } else {
    print("خطأ غير متوقع أثناء التسجيل: $e");
  }
  return false;
}

  }
}

