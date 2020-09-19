// To parse this JSON data, do
//
//     final generatedStock = generatedStockFromJson(jsonString);

import 'dart:convert';

GeneratedStockDaily generatedStockFromJson(String str) =>
    GeneratedStockDaily.fromJson(json.decode(str));

String generatedStockToJson(GeneratedStockDaily data) =>
    json.encode(data.toJson());

class GeneratedStockDaily {
  GeneratedStockDaily({
    this.metaData,
    this.timeSeriesDaily,
  });

  MetaData metaData;
  Map<String, TimeSeriesDaily> timeSeriesDaily;

  factory GeneratedStockDaily.fromJson(Map<String, dynamic> json) =>
      GeneratedStockDaily(
        metaData: MetaData.fromJson(json["Meta Data"]),
        timeSeriesDaily: Map.from(json["Time Series (Daily)"]).map((k, v) =>
            MapEntry<String, TimeSeriesDaily>(k, TimeSeriesDaily.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "Meta Data": metaData.toJson(),
        "Time Series (Daily)": Map.from(timeSeriesDaily)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class MetaData {
  MetaData({
    this.stockInfo,
    this.stockSymbol,
    this.lastRefreshed,
    this.outputSize,
    this.timeZone,
  });

  String stockInfo;
  String stockSymbol;
  DateTime lastRefreshed;
  String outputSize;
  String timeZone;

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
        stockInfo: json["1. Information"],
        stockSymbol: json["2. Symbol"],
        lastRefreshed: DateTime.parse(json["3. Last Refreshed"]),
        outputSize: json["4. Output Size"],
        timeZone: json["5. Time Zone"],
      );

  Map<String, dynamic> toJson() => {
        "1. Information": stockInfo,
        "2. Symbol": stockSymbol,
        "3. Last Refreshed":
            "${lastRefreshed.year.toString().padLeft(4, '0')}-${lastRefreshed.month.toString().padLeft(2, '0')}-${lastRefreshed.day.toString().padLeft(2, '0')}",
        "4. Output Size": outputSize,
        "5. Time Zone": timeZone,
      };
}

class TimeSeriesDaily {
  TimeSeriesDaily({
    this.openPrice,
    this.highPrice,
    this.lowPrice,
    this.closingPrice,
    this.tradeVolume,
  });

  String openPrice;
  String highPrice;
  String lowPrice;
  String closingPrice;
  String tradeVolume;

  factory TimeSeriesDaily.fromJson(Map<String, dynamic> json) =>
      TimeSeriesDaily(
        openPrice: json["1. open"],
        highPrice: json["2. high"],
        lowPrice: json["3. low"],
        closingPrice: json["4. close"],
        tradeVolume: json["5. volume"],
      );

  Map<String, dynamic> toJson() => {
        "1. open": openPrice,
        "2. high": highPrice,
        "3. low": lowPrice,
        "4. close": closingPrice,
        "5. volume": tradeVolume,
      };
}
