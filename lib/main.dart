import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todoapp_tech/pages/app_pages.dart';
import 'package:todoapp_tech/service/cache_provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheProvider.init();
  runApp(const MyApp());
  //Cache Provider
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      initialRoute: CacheProvider.signIn ? 'home' : 'login',
      routes: {
        'login': (BuildContext context) => const LoginPage(), 
        'home': (BuildContext context) => const HomePage(),
        'register': (BuildContext context) => const RegisterPage(),
        'createTask': (BuildContext context) => const CreateTaskPage(),
        'done': (BuildContext context) => const CompleteTaskPage(),
        'profile': (BuildContext context) => const ProfilePage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'ToDo G0tech',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Color.fromRGBO(217, 217, 217, 1),
          elevation: 10,
          iconTheme: IconThemeData(color: Color.fromRGBO(5, 59, 167, 1)),
          titleTextStyle: TextStyle(
            color: Color.fromRGBO(5, 59, 167, 1),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const LoginPage(),
    );
  }
}
