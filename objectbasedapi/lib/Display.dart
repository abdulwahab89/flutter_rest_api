import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ReusableCard.dart';

class Display extends StatelessWidget {
  Display({Key? key}) : super(key: key);
  var data;
  Future<void> getUserData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getUserData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Text('Loading'),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              children: [
                                ReusableRow(
                                  title: 'name',
                                  index: data[index]['name'].toString(),
                                ),
                                ReusableRow(
                                  title: 'username',
                                  index: data[index]['username'].toString(),
                                ),
                                ReusableRow(
                                  title: 'id',
                                  index: data[index]['id'].toString(),
                                ),
                                ReusableRow(
                                  title: 'address',
                                  index: data[index]['address']['street']
                                      .toString(),
                                ),
                              ],
                            ),
                          );
                        });
                  }
                }),
          )
        ],
      ),
    );
  }
}
