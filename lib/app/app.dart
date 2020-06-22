import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_application/common/bloc/connectivity/connectivity_bloc.dart';
import 'package:flutter_mobile_application/common/constants/env.dart';
import 'package:flutter_mobile_application/common/network/api_provider.dart';
import 'package:flutter_mobile_application/common/routes/route_generator.dart';
import 'package:flutter_mobile_application/common/routes/routes.dart';
import 'package:flutter_mobile_application/common/utils/internet_connectivity_validator.dart';
import 'package:flutter_mobile_application/feature/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_mobile_application/feature/authentication/bloc/authentication_event.dart';
import 'package:flutter_mobile_application/feature/authentication/repositories/user_authentication_repository.dart';
import 'package:flutter_mobile_application/generated/l10n.dart';
import 'theme.dart';

class App extends StatelessWidget {
  final Env env;

  App({Key key, @required this.env}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<Env>(
            create: (context) => env,
            lazy: true,
          ),
          RepositoryProvider<InternetCheck>(
            create: (context) => InternetCheck(),
            lazy: true,
          ),
          RepositoryProvider<UserAuthenticationRepository>(
            create: (context) => UserAuthenticationRepository(),
            lazy: true,
          ),
          RepositoryProvider<ApiProvider>(
            create: (context) => ApiProvider(),
            lazy: true,
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<ConnectivityBloc>(
              create: (context) {
                return ConnectivityBloc();
              },
            ),
            BlocProvider<AuthenticationBloc>(
              create: (context) {
                return AuthenticationBloc(
                    userRepository:
                        RepositoryProvider.of<UserAuthenticationRepository>(
                            context))
                  ..add(AuthStartedEvent());
              },
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const <AppLocalizationDelegate>[
              Content.delegate,
            ],
            supportedLocales: Content.delegate.supportedLocales,
            title: 'Flutter App',
            theme: basicTheme,
            onGenerateRoute: RouteGenerator.generateRoute,
            initialRoute: Routes.landing,
          ),
        ));
  }
}
