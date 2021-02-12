// import 'package:injectable/injectable.dart';
// import 'package:get_it/get_it.dart';
// import 'package:widgetpractice/Injectorables/i_counter_repository.dart';

// @injectableInit
// void configureInjection(String environment) =>
//     $initGetIt(environment: environment);

// final getIt = GetIt.instance;

// void $initGetIt({String environment}) {
//   if (environment == 'dev') {
//     _registerDevDependencies();
//   }
//   if (environment == 'prod') {
//     _registerProdDependencies();
//   }
// }

// void _registerDevDependencies() {
//   getIt..registerFactory<ICounterRepository>(() => CounterRespository());
// }

// void _registerProdDependencies() {
//   getIt..registerFactory<ICounterRepository>(() => CounterRespository());
// }

// abstract class Env {
//   static const dev = 'dev';
//   static const prod = 'prod';
// }
