import 'package:cloudwalk_assessment/env/env.dart';

class Constants {
  // string constants
  static String fontFamily = 'DMSans';
  static String baseUrl = "https://api.nasa.gov";
  static String apiPath =
      "$baseUrl/planetary/apod?api_key=${Env.apiKey}&start_date=2023-06-20";
  static String serverError = "Error retrieving images";
  static String socketError = "No Internet Connection";
  static String unknownError = "Something went wrong";
  static String lostConnection = "Please check your internet connection.";
  static String timeout = "Request timed out. Please try again later.";

  // double constants
  static double imageHeight = 240;
}
