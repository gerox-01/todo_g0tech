import 'package:flutter/material.dart';
import 'package:todoapp_tech/widgets/appbar.dart';
import 'package:todoapp_tech/widgets/drawer.dart';

class CompleteTaskPage extends StatelessWidget {
  const CompleteTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(text: 'CompleteTask'),
      drawer: const AppDrawerWidget(),
      body: const Center(
        child: Text('CompleteTask Page'),
      ),
    );
  }
}