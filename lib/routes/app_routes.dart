import 'package:flutter/material.dart';
import 'package:mi_portafolio/screens/screens.dart';

class AppRoutes {
  static const initialRoute = '/';
  static const signatureRoute = '/signature';

  static Map<String, Widget Function(BuildContext)> routes = {
    initialRoute: (BuildContext context) => const HomeScreen(),
    signatureRoute: (BuildContext context) => const SignatureScreen(),
  };
}
