class QueryDailyStock {
  String aQueryStart = 'https://www.alphavantage.co/query?';
  String aFunction = 'function=';
  String aSymbol = '&symbol=';
  String aInterval = '&interval=';
  String aOutput = '&outputsize=full';
  String aKey = '&apikey=H7M0B0U5EOMP1JBA';
  String queryFunctionParams = 'TIME_SERIES_DAILY';

  String search = 'IBM';

  //https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=IBM&apikey=H7M0B0U5EOMP1JBA

  String defaultQuery() {
    return 'https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=IBM&apikey=H7M0B0U5EOMP1JBA';
  }

  String queryBySymbol(String searchSymbol) {
    return 'https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=' +
        searchSymbol +
        '&apikey=H7M0B0U5EOMP1JBA';
  }
}
