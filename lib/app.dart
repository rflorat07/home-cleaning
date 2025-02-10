import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'data/repositories/authentication/authentication.dart';
import 'data/repositories/services/shared_preferences_service.dart';
import 'features/authentication/authentication.dart';
import 'features/splash/screens/splash.dart';
import 'routes/app_routes.dart';
import 'utils/utils.dart';

class App extends StatelessWidget {
  const App({
    required AuthenticationBlocRepository authenticationRepository,
    required SharedPreferencesService sharedPreferencesService,
    super.key,
  })  : _authenticationRepository = authenticationRepository,
        _sharedPreferencesService = sharedPreferencesService;

  final AuthenticationBlocRepository _authenticationRepository;
  final SharedPreferencesService _sharedPreferencesService;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        lazy: false,
        create: (context) => AuthenticationBloc(
            authenticationRepository: _authenticationRepository,
            sharedPreferencesService: _sharedPreferencesService)
          ..add(const AuthenticationStarted()),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppRouters.pages,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      //initialBinding: GeneralBindings(),
      unknownRoute: AppRouters.unknownRoute,

      /// - Show Loader or Circular Progress Indicator meanwhile Authentication Repository is deciding to show relevant screen.
      home: const SplashScreen(),
    );
  }
}
