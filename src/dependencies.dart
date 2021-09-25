import 'package:get_it/get_it.dart';

import 'services/aperos.dart';
import 'services/http.dart';

GetIt dependencies = GetIt.instance;

setupDependencies() {
  dependencies.registerSingleton<AperosService>(AperosService());
  dependencies.registerSingleton<HttpService>(HttpService());
}