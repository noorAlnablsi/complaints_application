

// import 'package:complaints_application/main.dart';
// import 'package:dio/dio.dart';


// class RegisterService {
//   static final Dio dio = Dio();

//   static Future<bool> register({
//     required String name,
//     required String nationalId,
//     required String contact,
//     required String password,
//     required String roleId,
//   }) async {
//     final url = '$baseUrl/api/auth/register'; // عدّل هنا

//     final data = {
//       "name": name,
//       "national_id": nationalId,
//       "identifier": contact,
//       "password": password,
//       "role_id": roleId,
//     };

//     try {
//       final response = await dio.post(
//         url,
//         data: data,
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
//     }catch (e) {
//   if (e is DioException) {
//     if (e.response != null) {
//       // طباعة كامل التفاصيل اللي جاية من السيرفر
//       print("خطأ أثناء التسجيل: ${e.response?.statusCode} - ${e.response?.data}");
//     } else {
//       print("خطأ أثناء التسجيل بدون رد من السيرفر: $e");
//     }
//   } else {
//     print("خطأ غير متوقع أثناء التسجيل: $e");
//   }
//   return false;
// }

//   }
// }


// register_service.dart
import 'package:dio/dio.dart';
import 'package:complaints_application/main.dart';

class RegisterService {
  static final Dio dio = Dio();

  static Future<bool> register({
    required String name,
    required String nationalId,
    required String contact,
    required String password,
    required int roleId, // صار int
  }) async {
    final url = '$baseUrl/api/auth/register';

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
    } catch (e) {
      if (e is DioException) {
        if (e.response != null) {
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
