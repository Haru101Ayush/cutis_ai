import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

class UploadImageScreen extends StatefulWidget {
  @override
  _UploadImageScreenState createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  final ImagePicker _picker = ImagePicker();

  Future<void> uploadImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      try {
        final Uri uri = Uri.parse('https://detect-skin-disease.p.rapidapi.com/facebody/analysis/detect-skin-disease');

        final http.MultipartRequest request = http.MultipartRequest('POST', uri);

        // Set headers
        request.headers['content-type'] =
        'multipart/form-data; boundary=---011000010111000001101001';
        request.headers['X-RapidAPI-Key'] =
        '92d29e3442mshde6303c8e49a8bep1feb20jsnb9ea17fc7cbc';
        request.headers['X-RapidAPI-Host'] =
        'detect-skin-disease.p.rapidapi.com';

        // Add image to request
        request.files
            .add(await http.MultipartFile.fromPath('image', image.path));

        final http.StreamedResponse response = await request.send();
        final responseData = await response.stream.bytesToString();

        print(responseData);

        // Convert responseData to Map
        Map<String, dynamic> responseMap = json.decode(responseData);

        print(responseMap['data']['results_english']);
        final dis = responseMap['data']['results_english'];
        setState(() {
         // rev = dis.toString();
        });
      } catch (e) {
        print('Error uploading image: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

