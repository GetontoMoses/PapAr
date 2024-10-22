import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://class-26.com/Getonto_Students/signup.php'; // Your API base URL

  static Future<void> signUp(
      String username, String email, String password, String confirmPassword) async {
    final String signUpUrl = '$baseUrl/signup.php'; // Your sign up API endpoint

    final Map<String, String> data = {
      'username': username,
      'email': email,
      'password': password,
      'confirm_password': confirmPassword,
    };

    try {
      final response = await http.post(Uri.parse(signUpUrl), body: data);

      if (response.statusCode == 200) {
        // Handle successful response
        print('Sign up successful');
      } else {
        // Handle other status codes
        print('Sign up failed: ${response.statusCode}');
      }
    } catch (e) {
      // Handle potential errors
      print('Error during sign up: $e');
    }
  }
}
