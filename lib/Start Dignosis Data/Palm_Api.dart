import 'package:google_generative_language_api/google_generative_language_api.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:convert';


Future<String> Prompt_Symptom(String prompt) async {
  // Create a request to the PaLM 2 API.
  final request =  GenerateTextRequest(
    prompt: TextPrompt(text: prompt),
    maxOutputTokens: 10000,
  );

  // Make the request to the PaLM 2 API.
  final response = await GenerativeLanguageAPI.generateText(
      modelName: 'models/text-bison-001',
      request: request,
      apiKey: 'AIzaSyC2BRBHnl3_5IaupF7EAUK-Lc0VDhyUWTA');

  // Return the generated text.
  final ai_response = response.candidates.map((candidate) => candidate.output).join('\n');

  return ai_response;
}


Future<String> AI_report(String prompt) async {
  // Create a request to the PaLM 2 API.
  final request =  GenerateTextRequest(
    prompt: TextPrompt(text:'Im a patient suffering from $prompt give me a step by step first Aid guide?'),
    maxOutputTokens: 10000,
  );

  // Make the request to the PaLM 2 API.
  final response = await GenerativeLanguageAPI.generateText(
      modelName: 'models/text-bison-001',
      request: request,
      apiKey: 'AIzaSyC2BRBHnl3_5IaupF7EAUK-Lc0VDhyUWTA');

  // Return the generated text.
  final ai_response = response.candidates.map((candidate) => candidate.output).join('\n');

  return ai_response;
}


//-------------------------------------------------------------------------------------------------->>>>>>>>>
// ----------------------------------- for uploading the image file -------------------------------->>>>>>>>>
//-------------------------------------------------------------------------------------------------->>>>>>>>>



Future<String> uploadImage() async {
  final ImagePicker _picker = ImagePicker();

  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

  if (image != null) {
    try {
      final Uri uri = Uri.parse('https://detect-skin-disease.p.rapidapi.com/facebody/analysis/detect-skin-disease');

      final http.MultipartRequest request = http.MultipartRequest('POST', uri);

      // Set headers
      request.headers['content-type'] =
      'multipart/form-data; boundary=---011000010111000001101001';
      request.headers['X-RapidAPI-Key'] =
      '82095835d8mshc8aa03ae7abf122p1485adjsn5a360ee65212';
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
      final Map<String,dynamic> dis = responseMap['data']['results_english'];
      final String disease=findHighestKey(dis);
      return disease;

    } catch (e) {
      print('Error uploading image: $e');
    }
  }
  return 'An error occurred';
}

String findHighestKey(Map<String,dynamic> map) {

  double highestValue = map.values.first;
  String highestKey = map.keys.first;

  map.forEach((key, value) {
    if (value > highestValue) {
      highestValue = value;
      highestKey = key;
    }
  });

  return highestKey;
}