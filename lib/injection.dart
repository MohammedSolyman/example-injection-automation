import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:my_arrangement/injection.config.dart';

final GetIt getIt = GetIt.instance;

// @injectableInit
// Future<void> configureDependencies(String env) async {
//   getIt.init(environment: env);
// }

@injectableInit
Future<void> configureDependencies() async {
  getIt.init();
}
