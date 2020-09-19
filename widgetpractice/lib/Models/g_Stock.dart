// To parse this JSON data, do
//
//     final stock = stockFromJson(jsonString);

import 'dart:convert';

List<Stock> stockFromJson(String str) =>
    List<Stock>.from(json.decode(str).map((x) => Stock.fromJson(x)));

String stockToJson(List<Stock> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Stock {
  Stock({
    this.name,
    this.sector,
    this.symbol,
  });

  String name;
  String sector;
  String symbol;

  factory Stock.fromJson(Map<String, dynamic> json) => Stock(
        name: json["Name"],
        sector: json["Sector"],
        symbol: json["Symbol"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Sector": sector,
        "Symbol": symbol,
      };
}
