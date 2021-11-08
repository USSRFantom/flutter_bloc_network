import 'dart:convert';

import 'package:flutter_bloc_network/models/user.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  //Используем Future для работы с сетью, получать будем массив обьектов
  Future<List<User>> getUser() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/users');

    if (response.statusCode == 200) {
      final List<dynamic> userJson =
          json.decode(response.body); //вспомогательная переменная
      return userJson
          .map((json) => User.fromJson(json))
          .toList(); //возвращаем пользователей и мапим сразу в список
    } else {
      throw Exception('Error'); //отображаем исключение если что-то пошло не так
    }
  }
}

//слой данных. Поставщик данных Data Provider
