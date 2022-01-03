import 'dart:convert';

import 'package:chalenge_dedy_priyatna_181011450420/models/users.dart';
import 'package:http/http.dart' as http;

class ApiUser {
  static Future<List<Users>> getUsers(int page) async {
    var url = Uri.parse(
        "https://api.github.com/users?per_page=50&since=" + page.toString());
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    // List<dynamic> listUser = (json as Map<String, dynamic>);
    // final parsed = json.cast<Map<String, dynamic>>();
    // print(object)
    if (response.statusCode == 200) {
      List<Users> listUser = [];

      json.forEach((item) {
        listUser.add(_convertToUser(item));
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
        for (var i = 0; i < listUser.length; i++) {
          user.add(_convertToUser(listUser[i]));
        }
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

Users _convertToUser(Map<String, dynamic> json) {
  return Users(
    login: json["login"],
    id: json["id"],
    nodeId: json["node_id"],
    avatarUrl: json["avatar_url"],
    gravatarId: json["gravatar_id"],
    url: json["url"],
    htmlUrl: json["html_url"],
    followersUrl: json["followers_url"],
    followingUrl: json["following_url"],
    gistsUrl: json["gists_url"],
    starredUrl: json["starred_url"],
    subscriptionsUrl: json["subscriptions_url"],
    organizationsUrl: json["organizations_url"],
    reposUrl: json["repos_url"],
    eventsUrl: json["events_url"],
    receivedEventsUrl: json["received_events_url"],
    type: json["type"],
    siteAdmin: json["site_admin"],
  );
}
