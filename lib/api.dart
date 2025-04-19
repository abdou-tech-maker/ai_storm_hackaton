import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

const String ayorUrl = "https://backend.dev.ayorservices.com/";
const String agentUrl = "https://storm-api-b2zj.onrender.com/";

String? accessToken;

Future<void> authenticate(String email, String password) async {
  final url = Uri.parse('${agentUrl}auth/jwt/create/');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'email': email, 'password': password}),
  );

  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);
    accessToken = responseData['access'];
    log('Access Token: $accessToken');
  } else {
    throw Exception('Failed to authenticate: ${response.body}');
  }
}

Future<Map<String, dynamic>> execute(String input) async {
  if (accessToken == null) {
    throw Exception(
        'Access token is not available. Please authenticate first.');
  }

  final url = Uri.parse('${agentUrl}v1/execute');
  final response = await http.post(
    url,
    body: jsonEncode({
      'recommandations': [input],
    }),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    },
  );

  if (response.statusCode == 200) {
    log('Action performed successfully: ${response.body}');
    return jsonDecode(response.body) as Map<String, dynamic>;
  } else {
    throw Exception('Failed to perform action: ${response.body}');
  }
}
