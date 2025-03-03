



import 'package:flutter/material.dart';
import 'routes.dart';

import '../../feature/Auth/presentation/pages/login.dart';


class AppRouter{

  Route generateRoute(RouteSettings settings) {
    final argument = settings.arguments;
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
    // BlocProvider(
    // create: (context) =>initializeDependencies<UserLogInBloc>(),
    // child:
    builder: (_)=> const LoginScreen(),
            // )
        );
        default:  return MaterialPageRoute(
            builder: (_)=>Scaffold(
              body: Center(
                child:  Text('No Route defined for${settings.name}'),
              ),

            )
        );
    }


  }
}