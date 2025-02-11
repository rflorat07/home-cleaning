import 'package:get_it/get_it.dart';

import 'data/repositories/services/shared_preferences_service.dart';

final sl = GetIt.instance;

Future<void> serviceLocatorInit() async {
  // Services
  sl.registerSingleton<SharedPreferencesService>(SharedPreferencesService());

  // Repositories
}
