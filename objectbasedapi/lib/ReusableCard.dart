import 'package:flutter/material.dart';

class ReusableRow extends StatelessWidget {
  ReusableRow({
    Key? key,
    this.title,
    this.index,
  }) : super(key: key);
  String? title;
  String? index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title.toString()), Text(index.toString())],
      ),
    );
  }
}
