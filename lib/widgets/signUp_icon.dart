import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpIcon extends StatelessWidget {
  SignUpIcon({
    required this.name,
    Key? key,
  }) : super(key: key);

  String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {}, child: SvgPicture.asset(name));
  }
}
