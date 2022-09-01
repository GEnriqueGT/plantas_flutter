class Planta {
  String mall;
  List<Datos> contents = [];
  Planta({required this.mall, required this.contents});

  factory Planta.fromJson(Map<String, dynamic> json) {
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

  factory Datos.fromJson(Map<String, dynamic> json) {
    return Datos(
      letra: json['letra'],
      dato: json['dato'],
    );
  }
}
