// // @Bind.toType()

// import 'dart:developer';

// import 'package:injectable/injectable.dart';
// import 'package:widgetpractice/Injectorables/injection.dart';

// // @Bind.toType(CounterRespository, env: Env.dev)
// @injectable
// abstract class ICounterRepository {
//   int getIncrement();
// }

// @Injectable(as: Service)
// class CounterRespository implements ICounterRepository {
//   @override
//   int getIncrement() => 1;
// }
