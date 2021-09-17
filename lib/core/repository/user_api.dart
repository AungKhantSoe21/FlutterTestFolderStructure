import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_test_folder_structure/core/model/user.dart';

// ignore: non_constant_identifier_names
UserApi() async {
    var uri = Uri.https('jsonplaceholder.typicode.com', 'users');

    final response = await http.get(uri);

    var data = jsonDecode(response.body);
    List users = [];

    for (var i in data) {
      User user = User(i['name'], i['email'], i['username']);
      users.add(user);
    }

    return users;
}