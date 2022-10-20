import 'package:flutter/material.dart';
import 'package:todoapp_tech/service/cache_provider.dart';
import 'package:todoapp_tech/widgets/button_primary.dart';


class AppDrawerWidget extends StatelessWidget {
  const AppDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logo.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Text('ToDo'),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Color.fromRGBO(5, 59, 167, 1)),
            title: const Text('Inicio'),
            onTap: () {
              Navigator.pushNamed(context, 'home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.check_circle, color: Color.fromRGBO(5, 59, 167, 1)),
            title: const Text('Completadas'),
            onTap: () {
              Navigator.pushNamed(context, 'done');
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_circle, color: Color.fromRGBO(5, 59, 167, 1)),
            title: const Text('Crear tarea'),
            onTap: () {
              Navigator.pushNamed(context, 'createTask');
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail, color: Color.fromRGBO(5, 59, 167, 1)),
            title: const Text('Perfil'),
            onTap: () {
              Navigator.pushNamed(context, 'profile');
            },
          ),
          Padding(padding: EdgeInsets.only(top: size.height * 0.35)),
          Container(
            width: size.width * 0.5,
            height: size.height * 0.05,
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
            child: ButtonStyleWidget(text: 'Cerrar sesión', onPressed: () {
              Navigator.pushNamed(context, 'login');
              CacheProvider.signIn = false;
            }),
          ),
        ],
      ),
    );
  }
}