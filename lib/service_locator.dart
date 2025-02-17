import 'package:get_it/get_it.dart';

import 'data/repositories/services/shared_preferences_service.dart';
import 'data/repositories/user/user_bloc.repository.dart';

final sl = GetIt.instance;

Future<void> serviceLocatorInit() async {
  // Services
  sl.registerSingleton<SharedPreferencesService>(SharedPreferencesService());

  // Repositories
  sl.registerSingleton<UserBlocRepository>(UserBlocRepository());
}
