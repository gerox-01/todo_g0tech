// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:io';
import 'package:http/io_client.dart';
import 'package:http/http.dart' as http;


class ApiService {
  static const String _baseUrl = 'http://192.168.1.14';

  // Método Get Genérico para obtener datos de la API
  static 
Future<dynamic> getData(String url) async {
  dynamic data;
  try {
    bool inDebug = true;
    url = "$_baseUrl/api/$url";

    dynamic respuesta;

    if (inDebug) {
      final HttpClient httpClient = HttpClient();
      httpClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      final HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));


      respuesta = await request.close();
      data = _returnResponse(respuesta);
      // if (respuesta.statusCode == 200) {
      //   data = jsonDecode(await respuesta.transform(utf8.decoder).join());
      // }
    }

    return data;
  } catch (e) {
    rethrow;
  }
}

  static _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response.body;
        return responseJson;
      case 400:
        throw Exception('Bad Request');
      case 401:
      case 403:
        throw Exception('Unauthorized');
      case 500:
      default:
        throw Exception('Internal Server Error');
    }
  }


  /// GET persona
  static Future<dynamic> getPersona() async {
    return await getData('personas');
  }
  
}