// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;


    return Scaffold(
      body: Center(
        child: SizedBox(
          width: size.width * 0.85,
          child: const FormLogin()),
      ),
    );
  }
}


class FormLogin extends StatefulWidget {
  const FormLogin({Key? key}) : super(key: key);

  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
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
          BuildTextLogin('Usuario:'),
          const FieldEmail(),
          BuildTextLogin('Contraseña:'),
          const FieldPassword(),
          BuildButton('Iniciar sesión'),
          Padding(padding: EdgeInsets.only(top: size.height * 0.05)),
          BuildButton('Registrese aquí ⬇'),
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
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        validator: (value) {
          const pattern = r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$';
          final regExp = RegExp(pattern);

          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }else if (!regExp.hasMatch(value)) {
            return 'Please enter a valid email';
          }
          return null;
        },
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
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
        ),
        validator: (value) {
          const pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
          final regExp = RegExp(pattern);
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }else
          return null;
        },
      ),
    );
  }
}


class BuildTextLogin extends StatelessWidget{
  String fieldText;
  BuildTextLogin(this.fieldText, {super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      child: Text(
        fieldText,
        style: TextStyle(
          fontSize: size.width * 0.05,
          fontWeight: FontWeight.w600,
          color: const Color.fromRGBO(5, 59, 167, 1)
        ),
      )
    );
  }
}

class BuildButton extends StatelessWidget{
  String buttonText;
  // GlobalKey<FormState> formKey;

  BuildButton(this.buttonText, {super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
            margin: EdgeInsets.only(top: size.height * 0.05),
            alignment: Alignment.center,
            child: ElevatedButton(
            onPressed: () {
              // print(buttonText);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(217, 217, 217, 0.7)),
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