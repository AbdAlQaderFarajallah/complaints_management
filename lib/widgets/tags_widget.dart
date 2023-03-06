import 'package:flutter/material.dart';

class TagWidget extends StatelessWidget {
  TagWidget({
    required this.name,
    super.key,
  });

  String name;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 8, bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: Center(
            child: Text(
          '# $name',
          style: TextStyle(color: Colors.grey[300]),
        )),
      ),
    );
  }
}
