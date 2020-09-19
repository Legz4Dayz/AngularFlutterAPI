import 'package:sailor/sailor.dart';

import 'Routes/AdvancedPracticePage.dart';
import 'Routes/FirebasePracticePage.dart';
import 'Routes/MyHomePage.dart';
import 'Routes/ProviderPracticePage.dart';
import 'Routes/WidgetPractice.dart';

class Router {
  static final sailor = new Sailor();

  static void createRoutes() {
    sailor.addRoutes([
      SailorRoute(
          name: '/initial',
          builder: (context, args, params) {
            return MyHomePage();
            //Passing args
            // return MyHomePage(args)
          },
          defaultTransitions: [SailorTransition.slide_from_left]),
      SailorRoute(
          name: '/widgetPractice',
          builder: (context, args, params) {
            return WidgetPracticePage();
          },
          defaultTransitions: [SailorTransition.slide_from_left]),
      SailorRoute(
          name: '/firebasePractice',
          builder: (context, args, params) {
            return FirebasePracticePage();
          }),
      SailorRoute(
          name: '/providerPractice',
          builder: (context, args, params) {
            return ProviderPracticePage();
          }),
      SailorRoute(
          name: '/advancedPractice',
          builder: (context, args, params) {
            return AdvancedPracticePage();
          })
    ]);
  }

  static void routeReturnMain() {
    Router.sailor.navigate('/initial', args: HomePageArgs(text: "yes"));
  }

  static void routeToWidgetPractice() {
    Router.sailor.navigate(
      '/widgetPractice',
    );
  }

  static void routeToFirebasePractice() {
    Router.sailor.navigate('/firebasePractice');
  }

  static void routeToProviderPractice() {
    Router.sailor.navigate('/providerPractice');
  }

  static void routeToAdvanced() {
    Router.sailor.navigate('/advancedPractice');
  }
}
