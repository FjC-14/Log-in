import 'package:flutter/material.dart';
import 'package:login_lp/routas.dart';
import 'autenticacion.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PantallaFinal(),
  ));
}

final emailController = TextEditingController();

class PantallaFinal extends StatelessWidget {
  const PantallaFinal({super.key});

  @override
  Widget build(BuildContext context) {
     final String? email = ModalRoute.of(context)?.settings.arguments as String?;
    final String displayEmail = email ?? 'usuario@unah.edu.hn';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '¡Bienvenido de nuevo!',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[50],
      ),
      backgroundColor: Colors.blueGrey[50],
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
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

                  Text(
                    'Bienvenido, $displayEmail',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                  ),
                  const SizedBox(height: 20),
                  const Icon(
                    Icons.person_outline,
                    color: Colors.blueGrey,
                    size: 100,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Empecemos a explorar',
                    style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blueGrey,
                      minimumSize: const Size(160, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Comencemos'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, MyRoutes.bienvenida.name);
        },
        child: const Icon(Icons.exit_to_app),
        backgroundColor: Colors.blueGrey[50],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
