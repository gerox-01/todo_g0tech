import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp_tech/widgets/button_primary.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return WillPopScope(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.2,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: size.height * 0.02),
                child: Text(
                  'ToDo G0tech 😎💙',
                  style: TextStyle(
                    color: const Color.fromRGBO(5, 59, 167, 1),
                    fontSize: 30,
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: size.height * 0.02),
                width: size.width * 0.8,
                height: size.height * 0.7,
                child: const FormRegister(),
              ),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        Navigator.popAndPushNamed(context, 'login');
        return false;
      } 
    );
  }
}

class FormRegister extends StatefulWidget {
  const FormRegister({Key? key}) : super(key: key);

  @override
  FormRegisterState createState() => FormRegisterState();
}

class FormRegisterState extends State<FormRegister> {
  // Key from register form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Usuario
          Container(
            margin: EdgeInsets.only(top: size.height * 0.02),
            child: Text(
              'Usuario:',
              style: TextStyle(
                fontSize: size.width * 0.035,
                fontWeight: FontWeight.w600,
                fontFamily: GoogleFonts.montserrat().fontFamily,
                color: const Color.fromRGBO(5, 59, 167, 1)
              ),
            )
          ),
          SizedBox(
            height: size.height * 0.07,
            child: TextFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(5, 59, 167, 1),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(5, 59, 167, 1),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingrese su nombre';
                }
                return null;
              },
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              cursorColor: const Color.fromRGBO(5, 59, 167, 1),
            ),
          ),
          // Nombre
          Container(
            margin: EdgeInsets.only(top: size.height * 0.02),
            child: Text(
              'Nombres:',
              style: TextStyle(
                fontSize: size.width * 0.035,
                fontWeight: FontWeight.w600,
                fontFamily: GoogleFonts.montserrat().fontFamily,
                color: const Color.fromRGBO(5, 59, 167, 1)
              ),
            )
          ),
          SizedBox(
            height: size.height * 0.07,
            child: TextFormField(
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:  BorderSide(
                    color:  Color.fromRGBO(5, 59, 167, 1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color:  Color.fromRGBO(5, 59, 167, 1),
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              cursorColor: const Color.fromRGBO(5, 59, 167, 1),
            ),
          ),
          // Correo
          Container(
            margin: EdgeInsets.only(top: size.height * 0.02),
            child: Text(
              'Correo:',
              style: TextStyle(
                fontSize: size.width * 0.035,
                fontWeight: FontWeight.w600,
                fontFamily: GoogleFonts.montserrat().fontFamily,
                color: const Color.fromRGBO(5, 59, 167, 1)
              ),
            )
          ),
          SizedBox(
            height: size.height * 0.07,
            child: TextFormField(
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:  BorderSide(
                    color:  Color.fromRGBO(5, 59, 167, 1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color:  Color.fromRGBO(5, 59, 167, 1),
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: const Color.fromRGBO(5, 59, 167, 1),
            ),
          ),
          // Contraseña
          Container(
            margin: EdgeInsets.only(top: size.height * 0.02),
            child: Text(
              'Contraseña:',
              style: TextStyle(
                fontSize: size.width * 0.035,
                fontWeight: FontWeight.w600,
                fontFamily: GoogleFonts.montserrat().fontFamily,
                color: const Color.fromRGBO(5, 59, 167, 1)
              ),
            )
          ),
          SizedBox(
            height: size.height * 0.07,
            child: TextFormField(
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:  BorderSide(
                    color:  Color.fromRGBO(5, 59, 167, 1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color:  Color.fromRGBO(5, 59, 167, 1),
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              cursorColor: const Color.fromRGBO(5, 59, 167, 1),
              obscureText: true,
            ),
          ),
          // Confirmar contraseña
          Container(
            margin: EdgeInsets.only(top: size.height * 0.02),
            child: Text(
              'Confirmar contraseña:',
              style: TextStyle(
                fontSize: size.width * 0.035,
                fontWeight: FontWeight.w600,
                fontFamily: GoogleFonts.montserrat().fontFamily,
                color: const Color.fromRGBO(5, 59, 167, 1)
              ),
            )
          ),
          SizedBox(
            height: size.height * 0.07,
            child: TextFormField(
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:  BorderSide(
                    color:  Color.fromRGBO(5, 59, 167, 1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color:  Color.fromRGBO(5, 59, 167, 1),
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              cursorColor: const Color.fromRGBO(5, 59, 167, 1),
              obscureText: true,
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: size.height * 0.02),
            child: ButtonStyleWidget(text: 'Registrarse!', onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}