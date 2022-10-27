import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp_tech/widgets/appbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp_tech/widgets/drawer.dart';
import 'package:todoapp_tech/service/api_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}


class _ProfilePageState extends State<ProfilePage> {
  // final PersonModel persona;

  void initState() {
    super.initState();
    ApiService.getPersona().then((value) {
      // persona = value;
      print(value);
    });
  }

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
        appBar: AppBarWidget(text: 'Perfil'),
        drawer: const AppDrawerWidget(),
        body: Center(
          child: Container(
            width: size.width * 0.75,
            height: size.height * 0.65,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: size.height * 0.02)),
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/background.jpg'),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: size.height * 0.02)),
                SizedBox(
                  width: size.width * 0.75,
                  height: size.height * 0.4,
                  child: ListView(
                    children: const [
                          ListTileProfileWidget(
                            icon: Icons.person,
                            titulo: 'Nombre',
                            subtitulo: 'Juan Perez',
                          ),
                          ListTileProfileWidget(
                            icon: Icons.email,
                            titulo: 'Correo',
                            subtitulo: 'cursos@g0tech.com',
                          ),
                          ListTileProfileWidget(
                            icon: Icons.pending_actions,
                            titulo: 'Tareas pendientes',
                            subtitulo: '6',
                          ),
                          ListTileProfileWidget(
                            icon: Icons.check_box,
                            titulo: 'Tareas completadas',
                            subtitulo: '3',
                          ),
                    ],
                  ),
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}


class ListTileProfileWidget extends StatelessWidget{
  final String titulo;
  final String subtitulo;
  final IconData icon;
  const ListTileProfileWidget({Key? key, required this.titulo,  required this.subtitulo, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListTile(
      leading: Icon(icon, color: const Color.fromRGBO(5, 59, 167, 1), size: 30),
      title: Text(
        titulo,
        style: TextStyle(
          color: Colors.black,
          fontSize: size.height * 0.015,
          fontFamily: GoogleFonts.montserrat().fontFamily,
          fontWeight: FontWeight.normal,
        ),
      ),
      subtitle: Text(
        subtitulo,
        style: TextStyle(
          color: const Color.fromRGBO(5, 59, 167, 1),
          fontSize: size.height * 0.015,
          fontFamily: GoogleFonts.montserrat().fontFamily,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}