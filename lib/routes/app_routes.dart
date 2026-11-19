import 'package:flutter/material.dart';
import 'package:mi_portafolio/screens/screens.dart';

class AppRoutes {
  // Ruta inicial de la aplicación
  static const initialRoute = '/';

  // Ruta específica para la firma del desarrollador
  static const signatureRoute = '/signature';

  // Mapa de rutas estáticas de la aplicación
  static Map<String, Widget Function(BuildContext)> routes = {
    initialRoute: (BuildContext context) => const HomeScreen(),
    signatureRoute: (BuildContext context) => const SignatureScreen(),
  };
}
