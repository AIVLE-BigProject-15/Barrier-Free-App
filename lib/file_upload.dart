import 'dart:typed_data';

import 'package:dio/dio.dart';

class FileApi {
  final _dio = Dio();

  Future<Response> uploadImage(
    Uint8List image,
  ) async {
    final formData = FormData.fromMap({
      'image': MultipartFile.fromBytes(image.buffer.asUint8List(),
          filename: 'lee.jpg'),
    });

    final response = await _dio.post(
      'http://10.0.2.2:8000/cafe/img_post',
      data: formData,
    );
    final age_dec = response;
    print(age_dec);
    return response;
  }
}
