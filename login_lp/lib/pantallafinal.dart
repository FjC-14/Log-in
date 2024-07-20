import 'package:flutter/material.dart';
import 'package:app_autenticacion/my_routes.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PantallaFinal(),
  ));
}

class PantallaFinal extends StatelessWidget {
  const PantallaFinal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            '!Bienvenido de nuevo!',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person_outline,
              color: Color.fromARGB(255, 25, 7, 91),
              size: 100,
            ),
            const SizedBox(height: 10),
            const Text(
              'Empecemos a explorar',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('Comencemos'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, MyRoutes.Bienvenida.name);
        },
        child: const Icon(Icons.exit_to_app),
        backgroundColor: Color.fromARGB(255, 251, 254, 255),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
