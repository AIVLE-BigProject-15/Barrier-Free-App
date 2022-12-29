import 'dart:typed_data';
import 'package:dio/dio.dart';
String? ageDec;

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
    ageDec = response.toString();
    print(ageDec);
    return response;
  }
}