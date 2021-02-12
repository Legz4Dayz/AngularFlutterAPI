import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => $initGetIt(getIt);

@injectable
class ServiceA {}

@injectable
class ServiceB {
  ServiceB(ServiceA serviceA);
}
