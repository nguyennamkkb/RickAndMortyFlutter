// user_feature/repository/user_repository.dart

import 'dart:convert';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<Map<String, String>> fetchUserData() async {
    final response = await http.get(Uri.parse('https://example.com/api/user'));
    
    if (response.statusCode == 200) {
      final Map<String, dynamic> userData = json.decode(response.body);
      final String name = userData['name'];
      final String email = userData['email'];
      return {'name': name, 'email': email};
    } else {
      throw Exception('Failed to load user data');
    }
  }
}
