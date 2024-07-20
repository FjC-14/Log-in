import 'package:flutter/material.dart';
import 'package:login_lp/routas.dart';

class Bienvenida extends StatelessWidget {
  const Bienvenida({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize= MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey[50], 
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 8, 
          margin: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05, vertical: screenSize.height * 0.05),
          child: Padding(
            padding: EdgeInsets.all(screenSize.width * 0.05),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                  'Comencemos',
                  style: TextStyle(
                    fontSize: screenSize.width * 0.1,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                SizedBox(height: screenSize.height * 0.02),
                const Icon(
                  Icons.account_circle,
                  size: 150,
                  color: Colors.blueGrey,
                ),
                const SizedBox(height: 40),
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
                        foregroundColor: Colors.white, backgroundColor: Colors.blueGrey, minimumSize: Size(screenSize.width * 0.05, 50), 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(width: screenSize.width * 0.01),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, MyRoutes.registro.name);
                      },
                      icon: const Icon(Icons.login), 
                      label: const Text('Registrarse'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, minimumSize: Size(screenSize.width * 0.05, 50), backgroundColor: Colors.blueGrey, 
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
