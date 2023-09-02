import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:api_test/APIs/users.dart';

Future<Users> getUsers () async {
  const url = 'https://jsonplaceholder.typicode.com/posts/2';
  final uri = Uri.parse(url);
  final response = await http.get(uri);

  if(response.statusCode == 200){
    return Users.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to get Users.');
  }
}

Future<Users> createUsers (String title, String body) async {
  Map<String, dynamic> request = {
    'title': title,
    'body': body,
    'userId': "111",
  };

  const url = 'https://jsonplaceholder.typicode.com/posts/';
  final uri = Uri.parse(url);
  final response = await http.post(uri, body: request);

  if(response.statusCode == 201){
    return Users.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create Users.');
  }
}

Future<Users> updateUsers (String title, String body) async {
  Map<String, dynamic> request = {
    'id': "101",
    'title': title,
    'body': body,
    'userId': "111",
  };

  const url = 'https://jsonplaceholder.typicode.com/posts/1';
  final uri = Uri.parse(url);
  final response = await http.put(uri, body: request);

  if(response.statusCode == 200){
    return Users.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to update Users.');
  }
}

Future<Users> deleteUsers() async {
  const url = 'https://jsonplaceholder.typicode.com/posts/1';
  final uri = Uri.parse(url);
  final response = await http.delete(uri);

  if(response.statusCode == 200){
    return Users.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to Delete Users.');
  }
}