// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:todoapp_tech/widgets/appbar.dart';
import 'package:todoapp_tech/widgets/button_second.dart';
import 'package:todoapp_tech/widgets/drawer.dart';

class CompleteTaskPage extends StatefulWidget {
  const CompleteTaskPage({Key? key}) : super(key: key);

  @override
  _CompleteTaskPageState createState() => _CompleteTaskPageState();
}

class _CompleteTaskPageState extends State<CompleteTaskPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBarWidget(text: 'Tareas Completadas'),
        drawer: const AppDrawerWidget(),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(top: 20),
                  child: ButtonStyleNormalWidget(
                    text: 'Crear tarea',
                    onPressed: () {
                      Navigator.pushNamed(context, 'createTask');
                    },
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: size.height * 0.02)),
                // Cards con una lista de radio buttons
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: size.height * 0.75,
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        /// Todo lo que se encuentra dentro de este return es un card con un radio button de hecho
                        return Card(
                          color: Colors.white,
                          child: ListTile(
                            title: Text('Tarea $index'),
                            // El leading es un icono de bien hecho (✔)
                            leading: Icon(
                              Icons.check_circle_outline,
                              color: Colors.green,
                              size: size.height * 0.04,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}