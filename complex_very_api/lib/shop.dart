import 'dart:convert';

import 'package:flutter/material.dart';
import 'Model/ProductModel.dart';
import 'package:http/http.dart' as http;

class Shop extends StatelessWidget {
  const Shop({Key? key}) : super(key: key);
  Future<ProductModel> getApi() async {
    final response = await http.get(
        Uri.parse('https://webhook.site/c7528f07-7b20-4f82-b2fb-13db250fd823'));

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ProductModel.fromJson(data);
    }
    return ProductModel.fromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
    children: [

    ],
      )
    );
  }
}
