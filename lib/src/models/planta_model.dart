class Planta {
  String mall;
  int q;
  int ph;
  int sslm;
  int ssed;
  int od;
  int nt;
  int pt;
  int dbo;
  int ss;

  Planta(
      {required this.mall,
      required this.q,
      required this.ph,
      required this.sslm,
      required this.ssed,
      required this.od,
      required this.nt,
      required this.pt,
      required this.dbo,
      required this.ss});

  factory Planta.fromJson(Map json) {
    return Planta(
        mall: json['mall'],
        q: json['q'],
        ph: json['ph'],
        sslm: json['sslm'],
        ssed: json['ssed'],
        od: json['od'],
        nt: json['nt'],
        pt: json['pt'],
        dbo: json['dbo'],
        ss: json['ss']);
  }
}
