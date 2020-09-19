import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
//Alpha Vantage documentation https://www.alphavantage.co/documentation/
import 'package:http/http.dart' as http;

import 'package:widgetpractice/Models/g_StockDaily.dart';
import 'package:widgetpractice/Models/queryDailyStock.dart';
import 'package:widgetpractice/Providers/timeKey.dart';

class StockProvider extends ChangeNotifier {
  QueryDailyStock alphaAPI = new QueryDailyStock();

  String currentTime = TimeKey().getCurrentTime();
  String currentDay = TimeKey().getToday();
  String symbol = 'IBM';
  String stockOptions;

  GeneratedStockDaily stockFull;
  TimeSeriesDaily stockSingle;
  // day query      'https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=IBM&interval=5min&outputsize=full&apikey=H7M0B0U5EOMP1JBA';
  // intraday query 'https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=IBM&apikey=H7M0B0U5EOMP1JBA

  Future<TimeSeriesDaily> get singleStock async {
    if (stockFull == null) {
      stockFull = await initializeGStock();
    }
    if (stockSingle == null) {
      // ignore: unnecessary_statements
      stockSingle = stockFull.timeSeriesDaily[currentDay];
    }
    return stockSingle;
  }

  String stockSymbol() {
    if (stockFull == null) {
      stockQuery;
    }
    return stockFull.metaData.stockSymbol;
  }

  String stockOpen() {
    singleStock;
    return stockPipe(stockSingle.openPrice);
  }

  String stockLow() {
    singleStock;
    return stockPipe(stockSingle.lowPrice);
  }

  String stockHigh() {
    singleStock;
    return stockPipe(stockSingle.highPrice);
  }

  String stockClose() {
    singleStock;
    return stockPipe(stockSingle.closingPrice);
  }

  String stockPipe(String stock) {
    return '\$' + stock.substring(0, stock.length - 2);
  }

  Future<GeneratedStockDaily> get stockQuery async {
    if (stockFull == null) {
      stockFull = await initializeGStock();
    }
    return stockFull;
  }

  Future<GeneratedStockDaily> initializeGStock() async {
    var getQuery = await http.get(alphaAPI.queryBySymbol(symbol));
    final generatedStock = generatedStockFromJson(getQuery.body);

    return generatedStock;
  }

  void reInitSingleStock() {
    this.stockSingle = this.stockFull.timeSeriesDaily[currentDay];
  }

  List<String> listTest = ['yes', 'that', 'works', 'F', 'ye'];
  List<String> changingListTest;

  List<String> get finalList {
    return listTest;
  }

  List<String> get mutableList {
    return changingListTest;
  }

  void mutableChange(List<String> change) {
    this.changingListTest = change;
  }

  Future<List<String>> getList() async {
    this.changingListTest = listTest;
    return changingListTest;
  }

  void searchBySymbol(String inputSymbol) async {
    this.symbol = inputSymbol;
    this.stockFull = await initializeGStock();
    reInitSingleStock();

    notifyListeners();
  }

  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/StockOptionsFile.json');
  }

  //  future: DefaultAssetBundle.of(context)
  //                   .loadString('assets/country.json')

  // parseJson() async {
  //   String stockData = 'assets/StockOptionsFile.json';

  //   // if (stockData == null) {
  //   //   return [];
  //   // }
  //   final parsed = json.decode(stockData).cast<Map<String, dynamic>>();
  //   print(parsed);
  //   this.stockOptions = parsed.map<Stock>((json) => new Stock.fromJson(json)).toList();
  // }
}
