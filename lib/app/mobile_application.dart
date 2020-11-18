import 'package:flutter_mobile_application/app/theme_config.dart';
import 'package:flutter_mobile_application/common/bloc/connectivity/connectivity_bloc.dart';
import 'package:flutter_mobile_application/common/bloc/connectivity/connectivity_state.dart';
import 'package:flutter_mobile_application/common/constants/environment.dart';
import 'package:flutter_mobile_application/common/network/api_client.dart';
import 'package:flutter_mobile_application/common/network/internet_connection_validator.dart';
import 'package:flutter_mobile_application/common/routes/route_generator.dart';
import 'package:flutter_mobile_application/common/routes/routes.dart';
import 'package:flutter_mobile_application/features/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_mobile_application/features/authentication/bloc/index.dart';
import 'package:flutter_mobile_application/features/authentication/repository/user_authentication_respository.dart';
import 'package:flutter_mobile_application/features/main/pages/account/repositories/account_repository.dart';
import 'package:flutter_mobile_application/features/main/repositories/configuration_repository.dart';
import 'package:flutter_mobile_application/features/signin/respositories/signin_repository.dart';
import 'package:flutter_mobile_application/features/signup/respositories/signup_repository.dart';
import 'package:flutter_mobile_application/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileApplication extends StatelessWidget {
  final Environment environment;

  const MobileApplication({Key key, this.environment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        _configureApplicationEnvironment(),
        _configureInternetValidator(),
        _configureUserAuthenticationRepository(),
        _configureApiClient(),
        _configureSignInRepository(),
        _configureSignUpRepository(),
        _configureAccountRepository(),
        _configureConfigurationRepository(),
      ],
      child: MultiBlocProvider(
        providers: [
          _configureInternetConnectivityBloc(),
          _configureAuthenticationBloc(),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const <AppLocalizationDelegate>[
            Content.delegate
          ],
          supportedLocales: [Locale("en")],
          theme: basicTheme,
          title: "Flutter mobile application",
          onGenerateRoute: RouteGenerator.generateRoute,
          initialRoute: Routes.landing,
        ),
      ),
    );
  }

  BlocProvider<AuthenticationBloc> _configureAuthenticationBloc() {
    return BlocProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc(
        UninitializedState(),
        RepositoryProvider.of<UserAuthenticationRespository>(context),
        RepositoryProvider.of<ApiClient>(context),
      )..add(
          AuthenticationStartedEvent(),
        ),
    );
  }

  BlocProvider<ConnectivityBloc> _configureInternetConnectivityBloc() {
    return BlocProvider<ConnectivityBloc>(
      create: (context) => ConnectivityBloc(
        AppStarted(),
      ),
    );
  }

  RepositoryProvider<ConfigurationRepository>
      _configureConfigurationRepository() {
    return RepositoryProvider<ConfigurationRepository>(
      create: (context) => ConfigurationRepository(
        RepositoryProvider.of<ApiClient>(context),
      ),
      lazy: true,
    );
  }

  RepositoryProvider<AccountRepository> _configureAccountRepository() {
    return RepositoryProvider<AccountRepository>(
      create: (context) => AccountRepository(
        RepositoryProvider.of<UserAuthenticationRespository>(context),
      ),
      lazy: true,
    );
  }

  RepositoryProvider<SignUpRepository> _configureSignUpRepository() {
    return RepositoryProvider<SignUpRepository>(
      create: (context) => SignUpRepository(
        RepositoryProvider.of<UserAuthenticationRespository>(context),
      ),
      lazy: true,
    );
  }

  RepositoryProvider<SignInRepository> _configureSignInRepository() {
    return RepositoryProvider<SignInRepository>(
      create: (context) => SignInRepository(
        RepositoryProvider.of<UserAuthenticationRespository>(context),
      ),
      lazy: true,
    );
  }

  RepositoryProvider<ApiClient> _configureApiClient() {
    return RepositoryProvider<ApiClient>(
      create: (context) => ApiClient(environment.baseUrl),
      lazy: true,
    );
  }

  RepositoryProvider<UserAuthenticationRespository>
      _configureUserAuthenticationRepository() {
    return RepositoryProvider<UserAuthenticationRespository>(
      create: (context) => UserAuthenticationRespository(),
      lazy: true,
    );
  }

  RepositoryProvider<InternetConnectionValidator>
      _configureInternetValidator() {
    return RepositoryProvider<InternetConnectionValidator>(
      create: (context) => InternetConnectionValidator(),
      lazy: true,
    );
  }

  RepositoryProvider<Environment> _configureApplicationEnvironment() {
    return RepositoryProvider<Environment>(
      create: (context) => environment,
      lazy: true,
    );
  }
}
