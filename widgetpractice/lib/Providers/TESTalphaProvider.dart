// Alpha Vantage documentation https://www.alphavantage.co/documentation/
// import 'package:firebase_project/models/g_StockDaily.dart';
// import 'package:firebase_project/utils/timeKey.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class AlphaP {
//   static final AlphaP _alphaP = AlphaP._internal();

//   String aQueryStart = 'https://www.alphavantage.co/query?';
//   String aFunction = 'function=';
//   String aSymbol = '&symbol=';
//   String aInterval = '&interval=';
//   String aOutput = '&outputsize=full';
//   String aKey = '&apikey=H7M0B0U5EOMP1JBA';
//   String currentTime = timeKey().getCurrentTime();
//   String currentDay = timeKey().getToday();

//   AlphaP._internal();

//   factory AlphaP() {
//     return _alphaP;
//   }

//   static GeneratedStockDaily stockFull;
//   static TimeSeriesDaily stockSingle;
//   example query 'https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=IBM&interval=5min&outputsize=full&apikey=H7M0B0U5EOMP1JBA';

//   Future<TimeSeriesDaily> get singleStock async {
//     if (stockFull == null) {
//       stockFull = await initializeGStock();
//     }
//     if (stockSingle == null) {
//       ignore: unnecessary_statements
//       stockSingle = stockFull.timeSeriesDaily[currentDay];
//     }
//     return stockSingle;
//   }

//   String stockSymbol() {
//     if (stockFull == null) {
//       stockQuery;
//     }
//     return stockFull.metaData.stockSymbol;
//   }

//   String stockOpen() {
//     singleStock;
//     return stockPipe(stockSingle.openPrice);
//   }

//   String stockLow() {
//     singleStock;
//     return stockPipe(stockSingle.lowPrice);
//   }

//   String stockHigh() {
//     singleStock;
//     return stockPipe(stockSingle.highPrice);
//   }

//   String stockClose() {
//     singleStock;
//     return stockPipe(stockSingle.closingPrice);
//   }

//   String stockPipe(String stock) {
//     return '\$' + stock.substring(0, stock.length - 2);
//   }

//   Future<GeneratedStockDaily> get stockQuery async {
//     if (stockFull == null) {
//       stockFull = await initializeGStock();
//     }
//     return stockFull;
//   }

//   Future<GeneratedStockDaily> initializeGStock() async {
//     var getQuery = await http.get(
//         'https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=IBM&apikey=H7M0B0U5EOMP1JBA');
//     final generatedStock = generatedStockFromJson(getQuery.body);
//     return generatedStock;
//   }
// }
