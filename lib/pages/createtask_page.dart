import 'package:flutter/material.dart';
import 'package:todoapp_tech/service/cache_provider.dart';
import 'package:todoapp_tech/widgets/appbar.dart';
import 'package:todoapp_tech/widgets/button_primary.dart';
import 'package:todoapp_tech/widgets/drawer.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({Key? key}) : super(key: key);

  @override
  CreateTaskPageState createState() => CreateTaskPageState();
}

class CreateTaskPageState extends State<CreateTaskPage> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String valorEstado = 'Selecciona una opción';

    return Container(
      width: size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBarWidget(text: 'Crear tarea'),
        drawer: const AppDrawerWidget(),
        body:  Center(
          child: SizedBox(
            width: size.width * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                  alignment: Alignment.center,
                  width: size.width,
                  height: size.height * 0.15,
                  child: const TextField(
                    maxLength: 50,
                    maxLines: 2,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Tarea:',
                    ),
                    textInputAction: TextInputAction.done,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: size.height * 0.02)),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  width: size.width,
                  height: size.height * 0.15,
                  child: DropdownButton<String>(
                    value: CacheProvider.estadoTarea,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Color.fromRGBO(5, 59, 167, 1)),
                    underline: Container(
                      height: 2,
                      color: const Color.fromRGBO(5, 59, 167, 1),
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        valorEstado = newValue ?? 'Selecciona una opción';
                        CacheProvider.estadoTarea = valorEstado;
                      });
                    },
                    items: <String>['Selecciona una opción', 'Completada', 'Pendiente']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: size.height * 0.02)),
                Container(
                  width: size.width * 0.5,
                  height: size.height * 0.05,
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                  child: ButtonStyleWidget(text: 'Crear tarea', onPressed: () {
                    Navigator.pushNamed(context, 'home');
                  }),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}