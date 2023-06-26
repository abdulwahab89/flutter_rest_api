import 'dart:convert';

import 'package:flutter/material.dart';
import 'Photos.dart';
import 'package:http/http.dart' as http;

class MyScreen extends StatelessWidget {
  MyScreen({Key? key}) : super(key: key);
  List<Photos> listPhotos = [];
  Future<List<Photos>> getPhotos() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        Photos photos = Photos(title: i['title'], url: i['url'], id: i['id']);
        listPhotos.add(photos);
      }
    }
    return listPhotos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API '),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPhotos(),
                builder: (context, AsyncSnapshot<List<Photos>> snapshot) {
                  return ListView.builder(
                      itemCount: listPhotos.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                snapshot.data![index].url.toString()),
                          ),
                          subtitle: Text(snapshot.data![index].id.toString()),
                          title: Text(snapshot.data![index].title.toString()),
                        );
                      });
                }),
          )
        ],
      ),
    );
  }
}
