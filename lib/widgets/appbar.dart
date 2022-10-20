// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';


class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  String text = '';
  AppBarWidget({Key? key, required this.text}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(text),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}