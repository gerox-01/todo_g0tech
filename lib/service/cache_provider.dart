
import 'package:shared_preferences/shared_preferences.dart';

class CacheProvider{

  static late SharedPreferences _prefs;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

   static bool _signIn = false;

  // signIn
  static bool get signIn {
    return _prefs.getBool('signIn') ?? _signIn;
  }

  static set signIn(bool signIn) {
    _signIn = signIn;
    _prefs.setBool('signIn', signIn);
  }

  // Estado tarea
  static String _estadoTarea = 'Selecciona una opción';

  static String get estadoTarea {
    return _prefs.getString('estadoTarea') ?? _estadoTarea;
  }

  static set estadoTarea(String estadoTarea) {
    _estadoTarea = estadoTarea;
    _prefs.setString('estadoTarea', estadoTarea);
  }
}