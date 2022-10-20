import 'package:flutter/material.dart';
import 'package:todoapp_tech/widgets/appbar.dart';
import 'package:todoapp_tech/widgets/drawer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(text: 'Profile'),
      drawer: const AppDrawerWidget(),
      body: const Center(
        child: Text('Profile Page'),
      ),
    );
  }
}