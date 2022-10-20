
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp_tech/service/cache_provider.dart';
import 'package:todoapp_tech/widgets/button_primary.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: size.width,
              height: size.height * 0.3,
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
              height: size.height * 0.6,
              child: const FormLogin(),
            ),
          ]
        ),
      )
    );
  }
}


class FormLogin extends StatefulWidget {
  const FormLogin({Key? key}) : super(key: key);

  @override
  FormLoginState createState() => FormLoginState();
}

class FormLoginState extends State<FormLogin> {
  // Key from login form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
            child: Text(
              'Usuario:',
              style: TextStyle(
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.w600,
                fontFamily: GoogleFonts.montserrat().fontFamily,
                color: const Color.fromRGBO(5, 59, 167, 1)
              ),
            )
          ),
          const FieldEmail(),
          Container(
            margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
            child: Text(
              'Contraseña:',
              style: TextStyle(
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.w600,
                fontFamily: GoogleFonts.montserrat().fontFamily,
                color: const Color.fromRGBO(5, 59, 167, 1)
              ),
            )
          ),
          const FieldPassword(),
          Container(
            margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
            alignment: Alignment.center,
            child:  ButtonStyleWidget(
              text: 'Iniciar Sesión',
              onPressed: () {
                if(_formKey.currentState!.validate()){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Procesando datos...'))
                  );
                  CacheProvider.signIn = true;
                  Navigator.pushNamed(context, 'home');
                }
              },
            ),
          ),
          Padding(padding: EdgeInsets.only(top: size.height * 0.05)),
          Container(
            margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
            alignment: Alignment.center,
            child:  ButtonStyleWidget(
              text: 'Registrarse aquí', 
              onPressed: () {
                Navigator.pushNamed(context, 'register');
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FieldEmail extends StatelessWidget {
  const FieldEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.07,
      child: TextFormField(
        textInputAction: TextInputAction.next,
        cursorColor: const Color.fromRGBO(5, 59, 167, 1),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide:  BorderSide(
              color: Color.fromRGBO(5, 59, 167, 1),
              width: 2,
            ),
          ),
        ),
        validator: (value) {
          // pattern for only letters and numbers
          const pattern = r'^[a-zA-Z0-9]+$';
          final regExp = RegExp(pattern);

          if (value == null || value.isEmpty) {
            return 'Por favor ingrese su usuario.';
          }else if (!regExp.hasMatch(value)) {
            return 'Por favor ingrese un usuario válido.';
          }
          return null;
        },
        keyboardType: TextInputType.name,
      ),
    );
  }
}

class FieldPassword extends StatelessWidget {
  const FieldPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.07,
      child: TextFormField(
        textInputAction: TextInputAction.done,
        cursorColor: const Color.fromRGBO(5, 59, 167, 1),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide:  BorderSide(
              color: Color.fromRGBO(5, 59, 167, 1),
              width: 2,
            ),
          ),
        ),
        validator: (value) {
          const pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
          final regExp = RegExp(pattern);
          if (value == null || value.isEmpty) {
            return 'Por favor ingrese su contraseña.';
          }else if(!regExp.hasMatch(value)) {
            return 'Por favor ingrese una contraseña válida.';
          }
          return null;
        },
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
      ),
    );
  }
}


// ignore: must_be_immutable
class BuildButton extends StatelessWidget{
  String buttonText;
  GlobalKey<FormState> formKey;

  BuildButton(this.buttonText, this.formKey, {super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: size.height * 0.05),
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {
          if(formKey.currentState!.validate()){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Procesando datos...'))
            );
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            )
          ),
          elevation: MaterialStateProperty.all(2),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color: const Color.fromRGBO(5, 59, 167, 1),
            fontSize: size.width * 0.05,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}