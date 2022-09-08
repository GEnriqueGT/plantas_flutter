class Planta {
  String mall;
  List<Datos> contents = [];
  Planta({required this.mall, required this.contents});

  factory Planta.fromJson(Map json) {
    return Planta(
        mall: json['plantass']['mall'], contents: json['plantas']['contents']);
  }
}

class Datos {
  String letra;
  int dato;
  Datos({required this.letra, required this.dato});

  factory Datos.fromJson(Map json) {
    return Datos(
      letra: json['plantas']['contents']['letra'],
      dato: json['plantas']['contents']['dato'],
    );
  }
}
