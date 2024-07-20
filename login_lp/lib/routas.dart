import 'package:flutter/material.dart';
import 'package:login_lp/autenticacion.dart';
import 'package:login_lp/bienvenida.dart';
import 'package:login_lp/registro.dart';



enum MyRoutes {
  bienvenida,
  autenticacion,
  registro,
  inicio,
  pantallafinal,
}

final Map<String, Widget Function(BuildContext)> routes = {
  MyRoutes.bienvenida.name: (context) => const Bienvenida(),
  MyRoutes.inicio.name: (context) => Autenticacion(),
  MyRoutes.registro.name : (context) => const Registro(),
  MyRoutes.pantallafinal.name : (context) => const PantallaFinal(),
};