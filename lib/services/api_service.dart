import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<dynamic> sendImage(String imagePath) async {
    var uri = Uri.parse('https://api.example.com/detect');
    var request = http.MultipartRequest('POST', uri);

    request.files.add(await http.MultipartFile.fromPath('image', imagePath));
    var response = await request.send();

    if (response.statusCode == 200) {
      var responseData = await response.stream.bytesToString();
      return responseData; // parse response and return necessary data
    } else {
      throw Exception('Failed to send image');
    }
  }
}
