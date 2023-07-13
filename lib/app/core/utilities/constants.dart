import 'package:cloudwalk_assessment/env/env.dart';

class Constants {
  static String fontFamily = 'Circular';
  static String baseUrl = "https://api.nasa.gov";
  static String apiPath = "$baseUrl/planetary/apod?api_key=${Env.apiKey}";

  // error responses
  static String socketError = "No Internet Connection";
  static String unknownError = "Something went wrong";
}
