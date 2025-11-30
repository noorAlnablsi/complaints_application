// // otp_service.dart
// import 'package:dio/dio.dart';
// import 'package:complaints_application/main.dart';

// class OtpService {
//   static final Dio dio = Dio();

//   static Future<bool> verifyOtp({
//     required String identifier,
//     required String code,
//   }) async {
//     final url = '$baseUrl/api/auth/verify';

//     final data = {
//       "identifier": identifier,
//       "code": code,
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
//         print("تم التحقق من الرمز بنجاح: ${response.data}");
//         return true;
//       } else {
//         print("فشل التحقق: ${response.data}");
//         return false;
//       }
//     } catch (e) {
//       if (e is DioException) {
//         if (e.response != null) {
//           print("خطأ أثناء التحقق: ${e.response?.statusCode} - ${e.response?.data}");
//         } else {
//           print("خطأ أثناء التحقق بدون رد من السيرفر: $e");
//         }
//       } else {
//         print("خطأ غير متوقع أثناء التحقق: $e");
//       }
//       return false;
//     }
//   }
// }
// verify_otp_service.dart
import 'package:dio/dio.dart';
import 'package:complaints_application/main.dart';

class VerifyOtpService {
  static final Dio dio = Dio();

  /// ترجع "success" إذا تحقق الكود
  /// "invalid" إذا الكود غير صحيح
  /// "expired" إذا الكود انتهت صلاحيته
  static Future<String> verifyOtp({
    required String identifier,
    required String otp,
  }) async {
    final url = '$baseUrl/api/auth/verify';
    final data = {
      "identifier": identifier,
      "code": otp,
    };

    try {
      final response = await dio.post(
        url,
        data: data,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        // تحقق ناجح
        return "success";
      } else {
        // تحقق فشل → حسب رسالة الباك
        if (response.data['message'] != null) {
          final msg = response.data['message'] as String;

          if (msg.contains("expired")) {
            return "expired";
          } else if (msg.contains("validation_failed")) {
            return "invalid";
          }
        }
        return "invalid"; // fallback
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response != null) {
          final status = e.response?.statusCode;
          final data = e.response?.data;
          print("Verify OTP error: $status - $data");
        } else {
          print("Verify OTP error without response: $e");
        }
      } else {
        print("Unexpected Verify OTP error: $e");
      }
      return "invalid"; // fallback على كل الحالات
    }
  }
}
