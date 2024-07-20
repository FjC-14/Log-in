import 'package:flutter/material.dart';
import 'package:login_lp/routas.dart';

class Bienvenida extends StatelessWidget {
  const Bienvenida({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50], 
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 8, 
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Bienvenido',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                const SizedBox(height: 20),
                const Icon(
                  Icons.account_circle,
                  size: 150,
                  color: Colors.blueGrey,
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
                        foregroundColor: Colors.white, backgroundColor: Colors.blueGrey, minimumSize: const Size(160, 50), 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, MyRoutes.registro.name);
                      },
                      icon: const Icon(Icons.login), 
                      label: const Text('Registrarse'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, minimumSize: const Size(160, 50), backgroundColor: Colors.blueGrey, 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), 
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
