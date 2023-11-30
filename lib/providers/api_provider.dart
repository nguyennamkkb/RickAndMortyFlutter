import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_app/models/character_model.dart';
import 'package:rick_and_morty_app/services/api_service.dart';
import 'package:rick_and_morty_app/services/common_service.dart';

class ApiProvider with ChangeNotifier {
  final ApiService api = ApiService();

  final url = 'rickandmortyapi.com';
  List<Character> characters = [];

  Future<void> getCharacters(int page) async {
    print(page);
    Response response = await api.get(CommonService.character + "?page=$page");
    Map<String, dynamic> jsonData = response.data;
    CharacterResponse characterResponse =
        await CharacterResponse.fromJson(jsonData);
    characters.addAll( characterResponse.results);
    notifyListeners();
  }
}
