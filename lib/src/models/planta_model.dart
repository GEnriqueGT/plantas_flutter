import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Planta {
  String mall;
  List<Datos> contents = [];
  Planta({required this.mall, required this.contents});

  factory Planta.fromJson(Map json) {
    return Planta(
      mall: json['mall'],
      contents: json['contents'],
    );
  }
}

class Datos {
  String letra;
  int dato;
  Datos({required this.letra, required this.dato});

  factory Datos.fromJson(Map json) {
    return Datos(
      letra: json['letra'],
      dato: json['dato'],
    );
  }
}
