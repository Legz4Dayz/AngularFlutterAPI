// To parse this JSON data, do
//
//     final generatedStock = generatedStockFromJson(jsonString);

import 'dart:convert';

GeneratedStockIntra generatedStockFromJson(String str) =>
    GeneratedStockIntra.fromJson(json.decode(str));

String generatedStockToJson(GeneratedStockIntra data) =>
    json.encode(data.toJson());

class GeneratedStockIntra {
  GeneratedStockIntra({
    this.metaData,
    this.timeSeriesDaily,
  });

  MetaData metaData;
  Map<String, TimeSeriesIntraDaily> timeSeriesDaily;

  factory GeneratedStockIntra.fromJson(Map<String, dynamic> json) =>
      GeneratedStockIntra(
        metaData: MetaData.fromJson(json["Meta Data"]),
        timeSeriesDaily: Map.from(json["Time Series (Daily)"]).map((k, v) =>
            MapEntry<String, TimeSeriesIntraDaily>(
                k, TimeSeriesIntraDaily.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "Meta Data": metaData.toJson(),
        "Time Series (Daily)": Map.from(timeSeriesDaily)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class MetaData {
  MetaData({
    this.the1Information,
    this.the2Symbol,
    this.the3LastRefreshed,
    this.the4OutputSize,
    this.the5TimeZone,
  });

  String the1Information;
  String the2Symbol;
  DateTime the3LastRefreshed;
  String the4OutputSize;
  String the5TimeZone;

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
        the1Information: json["1. Information"],
        the2Symbol: json["2. Symbol"],
        the3LastRefreshed: DateTime.parse(json["3. Last Refreshed"]),
        the4OutputSize: json["4. Output Size"],
        the5TimeZone: json["5. Time Zone"],
      );

  Map<String, dynamic> toJson() => {
        "1. Information": the1Information,
        "2. Symbol": the2Symbol,
        "3. Last Refreshed":
            "${the3LastRefreshed.year.toString().padLeft(4, '0')}-${the3LastRefreshed.month.toString().padLeft(2, '0')}-${the3LastRefreshed.day.toString().padLeft(2, '0')}",
        "4. Output Size": the4OutputSize,
        "5. Time Zone": the5TimeZone,
      };
}

class TimeSeriesIntraDaily {
  TimeSeriesIntraDaily({
    this.the1Open,
    this.the2High,
    this.the3Low,
    this.the4Close,
    this.the5Volume,
  });

  String the1Open;
  String the2High;
  String the3Low;
  String the4Close;
  String the5Volume;

  factory TimeSeriesIntraDaily.fromJson(Map<String, dynamic> json) =>
      TimeSeriesIntraDaily(
        the1Open: json["1. open"],
        the2High: json["2. high"],
        the3Low: json["3. low"],
        the4Close: json["4. close"],
        the5Volume: json["5. volume"],
      );

  Map<String, dynamic> toJson() => {
        "1. open": the1Open,
        "2. high": the2High,
        "3. low": the3Low,
        "4. close": the4Close,
        "5. volume": the5Volume,
      };
}
