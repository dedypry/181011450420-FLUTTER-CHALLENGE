import 'dart:convert';

import 'package:chalenge_dedy_priyatna_181011450420/models/users.dart';
import 'package:http/http.dart' as http;

class ApiUser {
  static Future<List<Users>> getUsers(int page) async {
    var url = Uri.parse(
        "https://api.github.com/users?per_page=10&since=" + page.toString());
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    // List<dynamic> listUser = (json as Map<String, dynamic>);
    // final parsed = json.cast<Map<String, dynamic>>();
    // print(object)
    if (response.statusCode == 200) {
      List<Users> listUser = [];

      json.forEach((item) {
        listUser.add(Users.fromJson(item));
      });
      return Future.value(listUser);
    } else {
      return Future.error(
          Exception("Request failed with status: ${response.statusCode}."));
    }
  }

  static Future<List<Users>> searchUsers(String search) async {
    var URL = Uri.parse("https://api.github.com/search/users?q=" + search);
    var response = await http.get(URL);

    var json = jsonDecode(response.body);
    try {
      if (response.statusCode == 200) {
        List<dynamic> listUser = (json as Map<String, dynamic>)['items'];
        List<Users> user = [];

        listUser.forEach((item) {
          user.add(Users.fromJson(item));
        });
        print(user.toString());
        return user;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
