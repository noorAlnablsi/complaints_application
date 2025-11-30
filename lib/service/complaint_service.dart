import 'dart:io';
import 'package:dio/dio.dart';

class ComplaintService {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://your-api-url.com",
      headers: {"accept": "application/json"},
    ),
  );

  static Future<bool> sendComplaint({
    required Map data,
    required List<File> images,
    required List<File> documents,
  }) async {
    try {
      final formData = FormData();

      data.forEach((key, value) {
        formData.fields.add(MapEntry(key, value.toString()));
      });

      for (final img in images) {
        formData.files.add(
          MapEntry(
            "images[]",
            await MultipartFile.fromFile(img.path),
          ),
        );
      }

      for (final doc in documents) {
        formData.files.add(
          MapEntry(
            "documents[]",
            await MultipartFile.fromFile(doc.path),
          ),
        );
      }

      final res = await dio.post(
        "/api/user/complaints",
        data: formData,
        options: Options(
          contentType: "multipart/form-data",
          validateStatus: (_) => true,
        ),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        return true;
      }

      print("Error response: ${res.data}");
      return false;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }
}
