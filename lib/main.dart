import 'package:bienes_servicios/src/blocs/authentication/authentication_bloc.dart';
import 'package:bienes_servicios/src/ui/pin_code/pin_code_screen.dart';
import 'package:bienes_servicios/src/ui/resend_email/resend_email_screen.dart';
import 'package:bienes_servicios/src/utils/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:bienes_servicios/src/blocs/my_bloc_observer.dart';
import 'package:bienes_servicios/src/repositories/login/login_repository.dart';
import 'package:bienes_servicios/src/ui/home/home_screen.dart';
import 'package:bienes_servicios/src/ui/login/login_screen.dart';
import 'package:bienes_servicios/src/ui/singUp/singup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  return runApp(RepositoryProvider<LoginRepository>(
    create: (context) => LoginRepository(),
    child: BlocProvider<AuthenticationBloc>(
      create: (context) {
        final loginRepository = RepositoryProvider.of<LoginRepository>(context);
        return AuthenticationBloc(loginRepository: loginRepository)
          ..add(AppLoaded());
      },
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [GlobalMaterialLocalizations.delegate],
      supportedLocales: [const Locale('en'), const Locale('es')],
      debugShowCheckedModeBanner: false,
      theme: aplicationTheme(),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
        if (state is AuthenticationAuthenticated) {
          return HomeScreen();
        }
        if (state is AuthenticationNotAuthenticated) {
          return LoginScreen();
        }
        if (state is AuthenticationLoading) {
          return Container(
            child: Text("splash"),
          );
        }
        if (state is AppLoaded) {
          return Scaffold(
            body: Container(
              child: Text("splashPEEEEE"),
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: Text("ASASASASSS"),
          ),
        );
      }),
      //initialRoute: Login.routeName,
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        SingUpScreen.routeName: (context) => SingUpScreen(),
        ResendEmailScreen.routeName: (context) => ResendEmailScreen(),
        PinCodeScreen.routeName: (context) => PinCodeScreen(),
      },
    );
  }
}
