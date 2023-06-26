import 'dart:convert';

import 'package:flutter/material.dart';
import 'Users.dart';
import 'package:http/http.dart' as http;

class MyScreen extends StatelessWidget {
  MyScreen({Key? key}) : super(key: key);
  List<Users> listUser = [];
  Future<List<Users>> getUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        listUser.add(Users.fromJson(i));
      }
    }
    return listUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getUsers(),
                builder: (context, AsyncSnapshot<List<Users>> snapshot) {
                  return ListView.builder(
                      itemCount: listUser.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snapshot.data![index].name.toString()),
                        );
                      });
                }),
          )
        ],
      ),
    );
  }
}
