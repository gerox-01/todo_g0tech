import 'package:flutter/material.dart';
import 'package:todoapp_tech/widgets/appbar.dart';
import 'package:todoapp_tech/widgets/button_primary.dart';
import 'package:todoapp_tech/widgets/button_second.dart';
import 'package:todoapp_tech/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

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
        appBar: AppBarWidget(text: 'Mis pendientes'),
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
                SizedBox(
                  height: size.height * 0.75,
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: Colors.white,
                          child: ListTile(
                            title: Text('Tarea $index'),
                            leading: Radio(
                              value: index,
                              groupValue: 21,
                              onChanged: (int? value) {
                                setState(() {
                                });
                              },
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