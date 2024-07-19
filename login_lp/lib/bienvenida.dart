import 'package:flutter/material.dart';
import 'package:login_lp/routas.dart';

class Bienvenida extends StatelessWidget {
  const Bienvenida({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card.outlined(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Bienvenido',
                style: TextStyle(fontSize: 50),
              ),
              const SizedBox(height: 20),
              const Icon(
                Icons.account_circle,
                size: 150,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                     ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, MyRoutes.inicio.name);
                },
                icon: const Icon(Icons.person_2), 
                label: const Text('Iniciar sesión'),
                style: ElevatedButton.styleFrom(
                        minimumSize: const Size(175, 50), 
                  ), 
                  ),
                ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, MyRoutes.registro.name);
                },
                icon: const Icon(Icons.login), 
                label: const Text('Registrarse'),
                style: ElevatedButton.styleFrom(
                        minimumSize: const Size(175, 50), 
                  ), 
                  ),
                ],
              )
            ],
          ),
        ),
      ),

    );
  }
}
